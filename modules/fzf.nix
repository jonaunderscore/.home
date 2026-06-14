{
  home.sessionVariables = {
    "FZF_COMPLETION_OPTS" = "--height=~12";
    "FZF_COMPLETION_DIR_OPTS" = "--walker dir,follow,hidden";
    "FZF_COMPLETION_PATH_OPTS" = "--walker file,dir,follow,hidden";
  };

  programs.fzf = {
    enable = true;
    colors = {
      "fg" = "#c6c8d1";
      "fg+" = "#c6c8d1";
      "bg" = "#161821";
      "bg+" = "#1e2132";
      "hl" = "#b4be82";
      "hl+" = "#b4be82";
      "info" = "#a093c7";
      "marker" = "#89b8c2";
      "prompt" = "#e27878";
      "spinner" = "#6b7089";
      "pointer" = "#c6c8d1";
      "header" = "#84a0c6";
      "gutter" = "#161821";
      "border" = "#6b7089";
      "label" = "#c6c8d1";
      "query" = "#c6c8d1";
    };
    changeDirWidgetCommand = "find -L . -mindepth 1 -path '*/.*' -prune -o -type d -printf '%P/\\n' 2>/dev/null";
    changeDirWidgetOptions = [ "--height=~12" ];
    defaultCommand = "find -L . -mindepth 1 -path '*/.*' -prune -o -not -type d -printf '%P\\n' 2>/dev/null";
    defaultOptions = [
      "--bind=tab:toggle+down,shift-tab:toggle+up"
      "--border=none"
      "--cycle"
      "--layout=reverse"
      "--preview-border=sharp"
      "--scroll-off=3"
    ];
    fileWidgetCommand = "find -L . -mindepth 1 -path '*/.*' -prune -o -type d -printf '%P/\\n' -o -not -type d -printf '%P\\n' 2>/dev/null";
    fileWidgetOptions = [ "--height=~12" ];
    historyWidgetOptions = [ "--height=~12" ];
  };
}
