{
  lib,
  config,
  ...
}: {
  options.myopt = {
    tmux.enable = lib.mkEnableOption "tmux";
  };
  config = lib.mkIf config.myopt.waybar.enable {
    home-manager.users.${config.myopt.username} = {
      programs.tmux = {
        enable = true;
        extraConfig = ''
          set-option -g default-terminal tmux-256color
          set-option -sa terminal-overrides ',tmux-256color:RGB'
          set-option -g default-shell "/usr/bin/bash"

          # Set prefix
          unbind C-b
          set -g prefix C-Space
          bind C-Space send-prefix


          # Start windows and panes at 1, not 0
          set -g base-index 1
          set -g pane-base-index 1
          set-window-option -g pane-base-index 1
          set-option -g renumber-windows on

          # set vi-mode
          set-window-option -g mode-keys vi
          # keybindings
          bind-key -T copy-mode-vi v send-keys -X begin-selection
          bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
          bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

          set -g @plugin 'tmux-plugins/tpm'
          set -g @plugin 'tmux-plugins/tmux-sensible'
          set -g @plugin 'christoomey/vim-tmux-navigator'
          set -g @plugin 'tmux-plugins/tmux-yank'

          set -g visual-activity off
          set -g visual-bell off
          set -g visual-silence off
          setw -g monitor-activity off
          set -g bell-action none

          # clock mode
          setw -g clock-mode-colour "#FFFFFF"


          # pane borders
          set -g pane-border-style 'fg=colour1'
          set -g pane-active-border-style 'fg=colour3'

          # statusbar
          set -g status-position bottom
          set -g status-justify left
          set -g status-style 'fg=#FFFFFF'
          set -g status-left
          set -g status-right '%Y-%m-%d %H:%M '
          set -g status-right-length 50
          set -g status-left-length 10

          setw -g window-status-current-style 'fg=#FFFFFF bg=#000000 bold'
          setw -g window-status-current-format ' #I #W #F '

          setw -g window-status-style 'fg=#000000 dim'
          setw -g window-status-format '#W #[fg=colour7]#F '

          setw -g window-status-bell-style 'fg=colour2 bg=colour1 bold'


          run '~/.tmux/plugins/tpm/tpm'

        '';
      };
    };
  };
}
