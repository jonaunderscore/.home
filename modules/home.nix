{ nixpkgs, home-manager, ... }:
{ config, pkgs, ... }:
{
  home = {
    extraDependencies = [ pkgs.stdenv ];
    language.collate = "C.UTF-8";
    packages = with pkgs; [
      nix
      nixd
      nixfmt
      pulsemixer
      spotify
      tree
      wget
      wl-clipboard
    ];
    sessionVariables = {
      BROWSER = "firefox";
      COSMIC_DATA_CONTROL_ENABLED = 1;
      EDITOR = "hx";
      TERMINAL = "foot";
    };
    shellAliases = {
      diff = "diff --color=auto";
      dotfiles = with config.home; "git --git-dir=${homeDirectory}/.dotfiles --work-tree=${homeDirectory}";
      grep = "grep --color=auto";
      la = "ls -a";
      ll = "la -l";
      ls = "ls --color=auto --human-readable";
    };
  };

  nix = {
    package = pkgs.nix;
    channels = { inherit nixpkgs; };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    registry.nixpkgs.to = {
      type = "path";
      path = "${nixpkgs}";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      flake-registry = "";
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    dircolors.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      stdlib = ''
        export DIRENV_ACTIVE=1
      '';
    };
    discord.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    home-manager = {
      enable = true;
      path = "${home-manager}";
    };
    htop.enable = true;
    jq.enable = true;
    less = {
      enable = true;
      options = {
        ignore-case = true;
        incsearch = true;
        search-options = "W";
        RAW-CONTROL-CHARS = true;
      };
    };
    mpv.enable = true;
    readline = {
      enable = true;
      variables = {
        completion-ignore-case = true;
        page-completions = false;
        skip-completed-text = true;
      };
    };
    ripgrep.enable = true;
  };

  services = {
    gnome-keyring.enable = true;
    ssh-agent.enable = true;
    wl-clip-persist.enable = true;
  };

  targets.genericLinux.enable = true;

  xdg = {
    enable = true;
    configFile."cosmic-mimeapps.list".source = config.xdg.configFile."mimeapps.list".source;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/epub+zip" = "org.pwmt.zathura.desktop";
        "application/mxf" = "mpv.desktop";
        "application/ogg" = "mpv.desktop";
        "application/oxps" = "org.pwmt.zathura.desktop";
        "application/pdf" = "org.pwmt.zathura.desktop";
        "application/postscript" = "org.pwmt.zathura.desktop";
        "application/sdp" = "mpv.desktop";
        "application/smil+xml" = "mpv.desktop";
        "application/vnd.apple.mpegurl" = "mpv.desktop";
        "application/vnd.comicbook+zip" = "org.pwmt.zathura.desktop";
        "application/vnd.comicbook-rar" = "org.pwmt.zathura.desktop";
        "application/vnd.ms-asf" = "mpv.desktop";
        "application/vnd.rn-realmedia" = "mpv.desktop";
        "application/x-cb7" = "org.pwmt.zathura.desktop";
        "application/x-cbt" = "org.pwmt.zathura.desktop";
        "application/x-cue" = "mpv.desktop";
        "application/x-fictionbook+xml" = "org.pwmt.zathura.desktop";
        "application/x-matroska" = "mpv.desktop";
        "application/x-mobipocket-ebook" = "org.pwmt.zathura.desktop";
        "application/x-shorten" = "mpv.desktop";
        "application/x-terminal-emulator" = "foot.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/xml" = "firefox.desktop";
        "audio/AMR" = "mpv.desktop";
        "audio/aac" = "mpv.desktop";
        "audio/ac3" = "mpv.desktop";
        "audio/flac" = "mpv.desktop";
        "audio/matroska" = "mpv.desktop";
        "audio/mp2" = "mpv.desktop";
        "audio/mp4" = "mpv.desktop";
        "audio/mpeg" = "mpv.desktop";
        "audio/ogg" = "mpv.desktop";
        "audio/vnd.dts" = "mpv.desktop";
        "audio/vnd.dts.hd" = "mpv.desktop";
        "audio/vnd.rn-realaudio" = "mpv.desktop";
        "audio/vnd.wave" = "mpv.desktop";
        "audio/webm" = "mpv.desktop";
        "audio/x-adpcm" = "mpv.desktop";
        "audio/x-aiff" = "mpv.desktop";
        "audio/x-ape" = "mpv.desktop";
        "audio/x-mpegurl" = "mpv.desktop";
        "audio/x-ms-asx" = "mpv.desktop";
        "audio/x-ms-wma" = "mpv.desktop";
        "audio/x-musepack" = "mpv.desktop";
        "audio/x-scpls" = "mpv.desktop";
        "audio/x-tta" = "mpv.desktop";
        "audio/x-vorbis+ogg" = "mpv.desktop";
        "audio/x-wavpack" = "mpv.desktop";
        "image/bmp" = "org.pwmt.zathura.desktop";
        "image/jpeg" = "org.pwmt.zathura.desktop";
        "image/png" = "org.pwmt.zathura.desktop";
        "image/svg+xml" = "org.pwmt.zathura.desktop";
        "image/tiff" = "org.pwmt.zathura.desktop";
        "image/vnd.djvu" = "org.pwmt.zathura.desktop";
        "image/vnd.djvu+multipage" = "org.pwmt.zathura.desktop";
        "image/x-eps" = "org.pwmt.zathura.desktop";
        "inode/directory" = "com.system76.CosmicFiles.desktop";
        "text/html" = "firefox.desktop";
        "text/plain" = "emacs.desktop";
        "text/tcl" = "emacs.desktop";
        "text/x-c++hdr" = "emacs.desktop";
        "text/x-c++src" = "emacs.desktop";
        "text/x-chdr" = "emacs.desktop";
        "text/x-csrc" = "emacs.desktop";
        "text/x-java" = "emacs.desktop";
        "text/x-makefile" = "emacs.desktop";
        "text/x-moc" = "emacs.desktop";
        "text/x-pascal" = "emacs.desktop";
        "text/x-shellscript" = "emacs.desktop";
        "text/x-tex" = "emacs.desktop";
        "video/3gpp" = "mpv.desktop";
        "video/3gpp2" = "mpv.desktop";
        "video/dv" = "mpv.desktop";
        "video/matroska" = "mpv.desktop";
        "video/mp2t" = "mpv.desktop";
        "video/mp4" = "mpv.desktop";
        "video/mpeg" = "mpv.desktop";
        "video/ogg" = "mpv.desktop";
        "video/quicktime" = "mpv.desktop";
        "video/vnd.avi" = "mpv.desktop";
        "video/vnd.mpegurl" = "mpv.desktop";
        "video/vnd.rn-realvideo" = "mpv.desktop";
        "video/webm" = "mpv.desktop";
        "video/x-flic" = "mpv.desktop";
        "video/x-flv" = "mpv.desktop";
        "video/x-ms-wmv" = "mpv.desktop";
        "video/x-ogm+ogg" = "mpv.desktop";
        "video/x-theora+ogg" = "mpv.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/terminal" = "foot.desktop";
      };
    };
    terminal-exec = {
      enable = true;
      settings.default = [ "foot.desktop" ];
    };
  };
}
