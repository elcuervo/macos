{ pkgs, ... }:

{
  enable = true;
  baseIndex = 1;
  keyMode = "vi";
  historyLimit = 100000;
  terminal = "screen-256color";

  prefix = "C-a";

  extraConfig = ''
             bind-key R                refresh-client
             bind-key x                kill-pane
             bind-key C-a              last-window
             bind-key C-s              next-window
             bind-key C-d              previous-window
             bind-key |                split-window -h
             bind-key \\               split-window -h
             bind-key -                split-window -v
             bind p paste-buffer
             set -g set-clipboard on
             set -g mouse on
    # UI
             set-option -g status-left "#[bg=colour241,fg=colour248] #S #[bg=colour237,fg=colour241,nobold,noitalics,nounderscore]"
    # Current window
             set-window-option -g window-status-current-format "#[fg=colour237, bg=colour214, nobold, noitalics, nounderscore] #[fg=colour239, bg=colour214]#I #[fg=colour239, bg=colour214, bold]#[fg=colour214, bg=colour237, nobold, noitalics, nounderscore]"
    # Other windows
             set-window-option -g window-status-format "#[fg=colour237,bg=colour239,noitalics] #[fg=colour223,bg=colour239]#I #[fg=colour223, bg=colour239]#[fg=colour239, bg=colour237, noitalics]"
    # Right status
             set-option -g status-right "#[fg=colour239, bg=colour237, nobold, nounderscore, noitalics] #[fg=colour246,bg=colour239]#[fg=colour248, bg=colour239, nobold, noitalics, nounderscore] #[fg=colour237, bg=colour248] #h "
  '';

  plugins = with pkgs.tmuxPlugins; [
    yank
    sensible
    resurrect
    vim-tmux-navigator

    gruvbox
  ];

}
