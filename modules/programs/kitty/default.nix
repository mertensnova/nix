{
  lib,
  pkgs,
  config,
  ...
}: {
  options.myopt= {
    kitty.enable = lib.mkEnableOption "kitty";
  };

  config = lib.mkIf config.myopt.kitty.enable {
    home-manager.users.${config.myopt.username} = {
      programs.kitty.enable = true;
programs.kitty.extraConfig = with config.stylix.base16Scheme; '' 
  foreground #FFFFFF
  background #000000
'';
      programs.kitty = {
        settings = {
          font_family = "JetbrainsMono Nerd Font";

          font_size = "11.6";


          background_opacity = "0.8";
          cursor_shape = "block";
          scrollback_lines = 10000;
          mouse_hide_wait = 3;
          url_style = "double";
          open_url_with = "firefox";

          url_prefixes = "http https file ftp gemini irc gopher mailto news git";

          detect_urls = true;
          select_by_word_characters = "@-./_~?&=%+#";
          focus_follows_mouse = true;
          confirm_os_window_close = 0;

          tab_bar_style = "powerline";
          tab_powerline_style = "angled";
          close_on_child_death = true;
          allow_remote_control = true;

        };

          
      };
    };
  };
}
