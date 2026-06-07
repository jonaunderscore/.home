{ pkgs, ... }:
{
  home.packages = with pkgs; [
      nerd-fonts.martian-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    configFile.disable-ligatures = {
      enable = true;
      text = ''
        <?xml version='1.0'?>
        <!DOCTYPE fontconfig SYSTEM 'urn:fontconfig:fonts.dtd'>
        <fontconfig>
          <match target="font">
            <edit name="fontfeatures" mode="append">
              <string>calt off</string>
              <string>clig off</string>
              <string>dlig off</string>
              <string>hlig off</string>
              <string>liga off</string>
            </edit>
          </match>
        </fontconfig>
      '';
    };
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "MartianMono Nerd Font" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
    hinting = "slight";
    subpixelRendering = "none";
  };
}
