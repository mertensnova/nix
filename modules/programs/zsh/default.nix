{
  lib,
  config,
  pkgs,
  ...
}: {
  options.myopt = {
    zsh.enable = lib.mkEnableOption "zsh";
  };
  config = lib.mkIf config.myopt.zsh.enable {
    home-manager.users.${config.myopt.username} = {
      programs.zsh = {
        enable = true;
        dotDir = ".config/zsh";
        enableCompletion = false;

        initExtraBeforeCompInit = ''

          autoload -Uz compinit
          compinit

          # export TERM='xterm-256color'
          export EDITOR='nvim'
          export VISUAL='nvim'
          export SUDO_EDITOR='nvim'

          bindkey -v

          setopt AUTO_CD
          setopt AUTO_LIST
          setopt AUTO_MENU
          setopt AUTO_PARAM_SLASH
          setopt AUTO_PUSHD
          setopt APPEND_HISTORY
          setopt ALWAYS_TO_END
          setopt COMPLETE_IN_WORD
          setopt EXTENDED_HISTORY
          setopt HIST_EXPIRE_DUPS_FIRST
          setopt HIST_FCNTL_LOCK
          setopt HIST_IGNORE_ALL_DUPS
          setopt HIST_IGNORE_DUPS
          setopt HIST_IGNORE_SPACE
          setopt HIST_REDUCE_BLANKS
          setopt HIST_SAVE_NO_DUPS
          setopt HIST_VERIFY
          setopt INC_APPEND_HISTORY
          setopt INTERACTIVE_COMMENTS
          setopt MENU_COMPLETE
          setopt NO_NOMATCH
          setopt PUSHD_IGNORE_DUPS
          setopt PUSHD_TO_HOME
          setopt PUSHD_SILENT
          setopt SHARE_HISTORY

          unsetopt CORRECT_ALL
          unsetopt HIST_BEEP
          unsetopt MENU_COMPLETE

          setopt appendhistory
          HISTFILE="$HOME/.local/share/zsh/zsh-history"
          HISTSIZE=1000
          SAVEHIST=1000


        '';
        initExtra = ''
          source <(fzf --zsh)
          setopt PROMPT_SUBST
          PROMPT="%F{red}󰊠 %~ %f"
          RPROMPT='$(gitprompt)'

          echo -e '( ._.)'

        '';

        plugins = with pkgs; [
          {
            name = "fast-syntax-highlighting";
            file = "fast-syntax-highlighting.plugin.zsh";
            src = fetchFromGitHub {
              owner = "zdharma-continuum";
              repo = "fast-syntax-highlighting";
              rev = "13d7b4e63468307b6dcb2dadf6150818f242cbff";
              sha256 = "0ghzqg1xfvqh9z23aga7aafrpxbp9bpy1r8vk4avi6b80p3iwsq2";
            };
          }
          {
            name = "zsh-autopair";
            file = "zsh-autopair.plugin.zsh";
            src = fetchFromGitHub {
              owner = "hlissner";
              repo = "zsh-autopair";
              rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
              sha256 = "0q9wg8jlhlz2xn08rdml6fljglqd1a2gbdp063c8b8ay24zz2w9x";
            };
          }
          {
            name = "zsh-autosuggestion";
            file = "zsh-autosuggestions.plugin.zsh";
            src = fetchFromGitHub {
              owner = "zsh-users";
              repo = "zsh-autosuggestions";
              rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
              hash = "sha256-B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
            };
          }
          {
            name = "git-prompt";
            file = "git-prompt.plugin.zsh";
            src = fetchFromGitHub {
              owner = "PsyNyde";
              repo = "git-prompt.zsh";
              rev = "bd2afa7ceaa8b6817719c56014423796268404d8";
              hash = "sha256-PZMin9f/G38TfI+YHLo1+dXZqXgm55nMWMG9eo4kSgo=";
            };
          }
        ];
      };
    };
  };
}
