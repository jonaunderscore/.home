{ nixpkgs, home-manager, ... }:
{ config, pkgs, ... }:
{
  home = {
    extraDependencies = [ pkgs.stdenv ];
    language.collate = "C.UTF-8";
    packages = with pkgs; [
      nix
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
        "audio/*" = "mpv.desktop";
        "image/*" = "org.pwmt.zathura.desktop";
        "inode/directory" = "com.system76.CosmicFiles.desktop";
        "text/*" = "emacs.desktop";
        "video/*" = "mpv.desktop";
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
