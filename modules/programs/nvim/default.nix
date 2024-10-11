{
  lib,
  pkgs,
  config,
  ...
}: {
  options.myopt = {
    nvim-config.enable = lib.mkEnableOption "nvim-config";
  };

  config = lib.mkIf config.myopt.nvim-config.enable {
    home-manager.users.${config.myopt.username} = {
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = false;
        vimdiffAlias = false;

        extraPackages = with pkgs; [
          go
          lua-language-server
          clang
          clang-tools
          gopls
          python3
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
                p.tree-sitter-templ
                p.tree-sitter-html
                p.tree-sitter-javascript
              ])
            );
          }
          neoformat
          colorbuddy-nvim
          nvim-web-devicons
          nvim-lspconfig
          cmp-nvim-lsp
          cmp-buffer
          luasnip
          friendly-snippets
          material-nvim
          lualine-nvim
          lsp-zero-nvim
          formatter-nvim
          refactoring-nvim
          harpoon
          vim-fugitive
          telescope-nvim
          trouble-nvim
          undotree
          nvim-cmp
          coc-diagnostic
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
                ${builtins.readFile ./plugins/formatting.lua}

        '';
      };
    };
  };
}
