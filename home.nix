{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mertens";
  home.homeDirectory = "/home/mertens";


programs.neovim = 
let 
lua = str: "lua << EOF\n${str}\nEOF\n";
luafile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{

   enable = true;
	extraPackages = with pkgs;[
         go
         clang
         gopls
python3
];

extraConfig = ''
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
let &undodir = expand('$HOME') . '/.vim/undodir'
set undofile
set nohlsearch
set incsearch
set termguicolors
set scrolloff=10
set signcolumn=yes
set updatetime=50
set colorcolumn=80
let mapleader = " "
set background=dark
let g:airline_theme = 'one'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
 '';
   viAlias = true;
   vimAlias = true;
   vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
       {
         plugin = tokyonight-nvim;
         config = luafile ./plugins/color.lua;
       }
  {
         plugin = undotree;
         config = luafile ./plugins/undotree.lua;
       }
 {
         plugin = nvim-lspconfig;
         config = luafile ./plugins/lsp.lua;
       }

 {
         plugin = mason-lspconfig-nvim;
         config = luafile ./plugins/lsp.lua;
       }

 {
         plugin = vim-fugitive;
         config = luafile ./plugins/fugative.lua;
       }

 {
         plugin = luasnip;
         config = luafile ./plugins/ncmp.lua;
       }

 {
         plugin = harpoon;
         config = luafile ./plugins/harpoon.lua;
       }

 {
         plugin = trouble-nvim;
         config = luafile ./plugins/trouble.lua;
       }

 {
         plugin = telescope-nvim;
         config = luafile ./plugins/telescope.lua;
       }

 {
         plugin = lualine-nvim;
         config = luafile ./plugins/lualine.lua;
       }
 {
         plugin = refactoring-nvim;
         config = luafile ./plugins/refactor.lua;
       }



       vim-tmux-navigator     
       friendly-snippets
       nvim-web-devicons
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-go
          p.tree-sitter-cpp
          p.tree-sitter-c
          p.tree-sitter-make
          p.tree-sitter-cmake
          p.tree-sitter-json
        ]));
      }

      vim-nix

    ];

};
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
   
  };

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
