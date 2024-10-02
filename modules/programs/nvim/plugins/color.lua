
--[[
require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
  },

   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.bg_dark = "#000814"
    colors.bg = "#000814"
    colors.black = "#000814"
  end
})

--]]
--vim.cmd[[colorscheme tokyonight]]
vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd("colorscheme oxocarbon")

--vim.cmd.colorscheme("colorbuddy")
-- or
vim.cmd.colorscheme("gruvbuddy")
--[[
require('material').setup({

    contrast = {
        terminal = true, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
        non_current_windows = false, -- Enable contrasted background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },


    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
    async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)
    custom_colors = nil, -- If you want to override the default colors, set this to a function
    custom_highlights = {}, -- Overwrite highlights with your own
})

vim.g.material_style = "deep ocean"
vim.cmd("colorscheme material")

--]]
