{ lib, pkgs, ... }:
let
  complete-alias = pkgs.fetchFromGitHub {
    owner = "cykerway";
    repo = "complete-alias";
    rev = "7f2555c2fe7a1f248ed2d4301e46c8eebcbbc4e2";
    hash = "sha256-yohvfmfUbjGkIoX4GF8pBH+7gGRzFkyx0WXOlj+Neag=";
  };
in {
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
    historyFileSize = -1;
    historySize = -1;
    initExtra = lib.mkMerge [
      (lib.mkOrder 50 ''
        printf '\e]0;%s\007' "''${PWD/#$HOME/\~}"
        declare -ax PROMPT_COMMAND=()
      '')
      (lib.mkOrder 3000 ''
        . '${complete-alias}/complete_alias'
        complete -F _complete_alias "''${!BASH_ALIASES[@]}"

        _osc7_cwd() {
          local strlen=''${#PWD}
          local encoded=
          local pos c o
          for (( pos=0; pos<strlen; pos++ )); do
            c=''${PWD:$pos:1}
            case "$c" in
              [-/:_.!\'\(\)~[:alnum:]]) o="$c" ;;
              *) printf -v o '%%%02X' "'$c" ;;
            esac
            encoded+="$o"
          done
          printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$encoded"
        }

        _set_prompt_contents() {
          PS0=
          PS1="\[\033[1;$((UID ? 32 : 31))m\]\\$"
          PS2=
          PS3='#? '
          PS4='+ '

          ((SHLVL - 1)) && PS1+='\[\033[22;37m\]+'
          ((DIRENV_ACTIVE)) && PS1+='\[\033[22;37m\]*'
          PS1+=' '

          local git_dir
          if git_dir="$(git rev-parse --show-toplevel 2>/dev/null)"; then
            PS1+="\[\033[1;37m\]''${PWD/#''${git_dir%/*}/…} "
            local git_branch="$(git rev-parse --abbrev-ref HEAD)"
            if [[ "$git_branch" != 'HEAD' ]]; then
              PS1+="\[\033[1;35m\]$git_branch "
            else
              PS1+="\[\033[1;33m\]$(git rev-parse --short HEAD) "
            fi
          else
            PS1+='\[\033[1;37m\]\w '
          fi

          local exit_status_indicator="\[\033[22;$((previous_exit_status ? 31 : 90))m\]•"
          PS1+="$exit_status_indicator \[\033[0m\]"
          PS2+="$exit_status_indicator \[\033[0m\]"
        }

        _prompt_hook() {
          local previous_exit_status=$?
          history -a
          _osc7_cwd
          printf '\e]133;A\e\\\e]133;D\e\\'
          _set_prompt_contents
          PS0+='\e]133;C\e\\'
          PS1+='\[\e]0;\w\a\]'
          return $previous_exit_status
        }

        PROMPT_COMMAND=("''${PROMPT_COMMAND[@]}" _prompt_hook)

        _debug_set_title() {
          if [[ "$BASH_COMMAND" != _* ]]; then
            printf '\e]0;%s `%s`\007' "''${PWD/#$HOME/\~}" "$BASH_COMMAND"
          else
            printf '\e]0;%s\007' "''${PWD/#$HOME/\~}"
          fi
        }

        trap _debug_set_title DEBUG
      '')
    ];
    shellOptions = [
      "checkjobs"
      "dotglob"
      "extglob"
      "globstar"
      "histappend"
    ];
  };
}
