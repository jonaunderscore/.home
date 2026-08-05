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
    readline = {
      enable = true;
      variables = {
        completion-ignore-case = true;
        skip-completed-text = true;
      };
    };
    ripgrep.enable = true;
    zathura.enable = true;
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
        "application/x-terminal-emulator" = "foot.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "text/html" = "firefox.desktop";
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
