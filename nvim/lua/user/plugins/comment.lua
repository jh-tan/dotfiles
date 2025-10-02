return {
  {
    'numToStr/Comment.nvim',

    config = function()
      require('Comment').setup {
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
          ---Line-comment toggle keymap
          line = ',c<SPACE>',
        },
        opleader = {
          line = ',c',
          block = ',cs',
        },
      }
    end
  },
}
