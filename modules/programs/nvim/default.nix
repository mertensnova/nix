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
            clang
            gopls
            python3
          ];
          extraConfig = "luafile ${./plugins/set.lua}";
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
              plugin = nvim-cmp;
              config = "luafile ${./plugins/ncmp.lua}";
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
              config = "luafile ${./plugins/telescope.lua}";
            }

            {
              plugin = lualine-nvim;
              config = "luafile ${./plugins/lualine.lua}";
            }
            {
              plugin = refactoring-nvim;
              config = "luafile ${./plugins/refactor.lua}";
            }
            cmp-buffer
            cmp-path
            cmp_luasnip
            cmp-nvim-lsp
            cmp-nvim-lua
            vim-tmux-navigator
            friendly-snippets
            nvim-web-devicons
            lspkind-nvim
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

            vim-nix
          ];
        };
    };
  };
}


