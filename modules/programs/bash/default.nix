{
  lib,
  config,
  ...
}: {
  options.myopt = {
    bash.enable = lib.mkEnableOption "bash";
  };
  config = lib.mkIf config.myopt.bash.enable {
    home-manager.users.${config.myopt.username} = {
      programs.bash = {
        enable = true;
        enableCompletion = true;
        bashrcExtra = ''
          source ~/.git-prompt.sh

          case $- in
              *i*) ;;
                *) return;;
          esac

          export MOZ_ENABLE_WAYLAND=1
          HISTCONTROL=ignoreboth
          shopt -s histappend

          HISTSIZE=1000
          HISTFILESIZE=2000

          shopt -s checkwinsize

          export PS1="\[$(tput setaf 216)\]\u\[$(tput setaf 220)\]@\[$(tput setaf 222)\]\h \[$(tput setaf 229)\]\W\[$(tput sgr0)\] \$ "


          #[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


          if [ -x /usr/bin/dircolors ]; then
              test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
              alias ls='ls --color=auto'
              alias grep='grep --color=auto'
              alias fgrep='fgrep --color=auto'
              alias egrep='egrep --color=auto'
          fi

          # some more ls aliases
          alias ll='ls -alF'
          alias la='ls -A'
          alias l='ls -CF'

          alias vi="nvim"
          alias ls='ls --color=auto'
          alias grep='grep --color=auto'

          alias reswifi="sudo systemctl restart NetworkManager"
          alias nn="fastfetch"
          alias rr="reboot"
          alias sss="shutdown -P now"

          if [ -f ~/.bash_aliases ]; then
              . ~/.bash_aliases
          fi
        '';
      };
    };
  };
}
