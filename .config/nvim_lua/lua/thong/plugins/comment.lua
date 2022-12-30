local setup, comment = pcall(require, 'Comment')

if not setup then
  print('Comment is not installed!')
  return
end

comment.setup()
