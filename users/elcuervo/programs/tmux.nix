{ pkgs, ... }:

let
  tmux-nova = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "nova";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "o0th";
      repo = "tmux-nova";
      rev = "3e56f80a12b284cd33ab25d58671799e983dc70c";
      sha256 = "sha256-xT4V6ot1o9A8hNKr3mAr7pgl9FYlFxcionR3vIYAfzY=";
    };
  };
in
{
  enable = true;
  baseIndex = 1;
  keyMode = "vi";
  historyLimit = 100000;
  terminal = "screen-256color";
  clock24 = true;

  sensibleOnTop = true;

  prefix = "C-a";

  extraConfig = ''
    bind-key R refresh-client
    bind-key x kill-pane
    bind-key C-a last-window
    bind-key C-s next-window
    bind-key C-d previous-window
    bind-key | split-window -h
    bind-key \\ split-window -h
    bind-key - split-window -v
    bind p paste-buffer

    set -g set-clipboard on
    set -g mouse on

  '';

  plugins = with pkgs.tmuxPlugins; [
    yank
    vim-tmux-navigator

    {
      plugin = tmux-nova;
      extraConfig = ''
        set -g @plugin 'o0th/tmux-nova'

        set -g @nova-nerdfonts false
        set -g @nova-nerdfonts-left ""
        set -g @nova-nerdfonts-right ""

        set -g @nova-segment-mode "#S"
        set -g @nova-segment-mode-colors "#50fa7b #282a36"

        set -g @nova-segment-whoami "#h"
        set -g @nova-segment-whoami-colors "#50fa7b #282a36"

        set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}"

        set -g @nova-rows 0
        set -g @nova-segments-0-left "mode"
        set -g @nova-segments-0-right "whoami "
      '';
    }
  ];
}
