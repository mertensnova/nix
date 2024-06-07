{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.myopt = {
    nvim-config.enable = lib.mkEnableOption "nvim-config";
  };

  config = lib.mkIf config.myopt.nvim-config.enable {
    home-manager.users.${config.myopt.username} = {
      programs.neovim =
        let
          lua = str: "lua << EOF\n${str}\nEOF\n";
          luafile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
        in
        {
          enable = true;
          viAlias = true;
          vimAlias = true;
          vimdiffAlias = true;

          extraPackages = with pkgs; [
            go
            lua-language-server
            clang
            clang-tools
            gopls
            python3
            fd
            unzip
            ripgrep
	    nixd
nodejs_20
          ];

          plugins = with pkgs.vimPlugins; [
            {
              plugin = (
                nvim-treesitter.withPlugins (p: [
                  p.tree-sitter-nix
                  p.tree-sitter-bash
                  p.tree-sitter-lua
                  p.tree-sitter-go
                  p.tree-sitter-cpp
                  p.tree-sitter-c
                  p.tree-sitter-make
                  p.tree-sitter-cmake
                  p.tree-sitter-json
                ])
              );
            }
nvim-lspconfig
cmp-nvim-lsp
cmp-buffer
luasnip
gruvbox-nvim
friendly-snippets
            tokyonight-nvim
            lualine-nvim
            lsp-zero-nvim
            refactoring-nvim
            harpoon
            vim-fugitive
            telescope-nvim
            trouble-nvim
            undotree
            vim-nix
            nvim-cmp
            cmp_luasnip
          ];

          extraLuaConfig = ''

            		${builtins.readFile ./plugins/icons.lua}
            		${builtins.readFile ./plugins/cmp.lua}
            		${builtins.readFile ./plugins/lsp.lua}
            		${builtins.readFile ./plugins/lualine.lua}
            		${builtins.readFile ./plugins/color.lua}
            		${builtins.readFile ./plugins/refactoring.lua}
            		${builtins.readFile ./plugins/fugitive.lua}
            		${builtins.readFile ./plugins/harpoon.lua}
            		${builtins.readFile ./plugins/set.lua}
            		${builtins.readFile ./plugins/remap.lua}
             	 '';
        };
    };
  };
}


