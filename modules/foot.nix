{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "MartianMono Nerd Font:size=13";
        font-size-adjustment = 1;
        line-height = 18;
        pad = "0x0";
        initial-window-size-chars = "80x30";
      };
      scrollback = {
        lines = 15000;
        multiplier = 3.0;
        indicator-position = "none";
      };
      cursor = {
        style = "block";
        unfocused-style = "hollow";
        blink = false;
        blink-rate = 750;
      };
      mouse.hide-when-typing = true;
      colors-dark = {
        cursor = "161821 c6c8d1";
        foreground = "c6c8d1";
        background = "161821";
        regular0 = "1e2132";
        regular1 = "e27878";
        regular2 = "b4be82";
        regular3 = "e2a478";
        regular4 = "84a0c6";
        regular5 = "a093c7";
        regular6 = "89b8c2";
        regular7 = "c6c8d1";
        bright0 = "6b7089";
        bright1 = "e98989";
        bright2 = "c0ca8e";
        bright3 = "e9b189";
        bright4 = "91acd1";
        bright5 = "ada0d3";
        bright6 = "95c4ce";
        bright7 = "d2d4de";
        selection-background = "272c42";
      };
      key-bindings.fullscreen = "F11";
    };
  };
}
