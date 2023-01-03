local has = vim.fn.has
local opt = vim.opt_local

-- setup options
opt.shiftwidth = 4
opt.tabstop = 4
opt.cmdheight = 2


local jdtls_status, jdtls = pcall(require, 'jdtls')
if not jdtls_status then
  print 'jdtls is not installed!'
  return
end

-- local user_lsp_handlers_status, user_lsp_handlers = pcall(require, 'user.lsp.handlers')
-- if not user_lsp_handlers_status then
--   print 'user.lsp.handlers is not installed'
--   return
-- end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
  print 'cmp_nvim_lsp is not installed!'
  return
end

-- Determine OS
local home_dir = os.getenv "HOME"
if has 'mac' then
  WORKSPACE_PATH = home_dir .. '/projects/backend' -- specific path for CH devices
  CONFIG_OS = 'mac'
elseif has 'unix' then
  WORKSPACE_PATH = home_dir .. '/projects/backend' -- specific path for CH devices
  CONFIG_OS = 'unix'
else
  print 'Unsupported system'
end

-- Find project root
local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)

if root_dir == '' then
  print('root_dir not found!')
  return
end

local extend_client_capabilities = jdtls.extendedClientCapabilities
extend_client_capabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = WORKSPACE_PATH .. project_name

JAVA_DAP_ACTIVE = true
local bundles = {}

if JAVA_DAP_ACTIVE then
  vim.list_extend(bundles, vim.split(vim.fn.glob(home_dir .. '/.config/nvim/vscode-java-test/server/*.jar'), '\n'))
  vim.list_extend(
    bundles,
    vim.split(
      vim.fn.glob(home_dir .. '/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar'),
      '\n'
    )
  )
end

local mason_path = home_dir .. '/.local/share/nvim/mason'
local config = {
  on_attach = require('thong.plugins.lsp.javaconfig').on_attach,
  capabilities = require('thong.plugins.lsp.javaconfig').capabilities,
  flags = {
    debounce_text_changes = 150,
    allow_incremental_sync = true,
  },
  cmd = {
    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. home_dir .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', home_dir .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version

    '-configuration', mason_path .. '/packages/jdtls/config_' .. CONFIG_OS,
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.
    -- See `data directory configuration` section in the README
    '-data', workspace_dir
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  -- root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      completion = {
        enabled = true,
        filteredTypes = { 'java', 'javax', 'com', 'org' }
      },
      referenceCodeLens = {
        enabled = true,
      },
      format = {
        enabled = false,
      }
    },
    signatureHelp = {
      enabled = true,
    },
    completion = {
      favoriteStaticMembers = {
        'org.hamcrest.MatcherAssert.assertThat',
        'org.hamcrest.Matchers.*',
        'org.hamcrest.CoreMatchers.*',
        'org.junit.jupiter.api.Assertions.*',
        'java.util.Objects.requireNonNull',
        'java.util.Objects.requireNonNullElse',
        'org.mockito.Mockito.*',
      },
    },
    contentProvider = {
      preferred = 'fernflower'
    },
    extendedClientCapabilities = extend_client_capabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = '${object.className}{${member.name()}=${member.value}}'
      },
      useBlocks = true,
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
  },
}

-- Start a new client and server
-- or attaches to an existing one
jdtls.start_or_attach(config)

vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
vim.cmd "command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()"
-- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
vim.cmd "command! -buffer JdtBytecode lua require('jdtls').javap()"
-- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"

