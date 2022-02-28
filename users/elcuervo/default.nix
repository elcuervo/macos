{ pkgs, inputs, system, lib, ... }:

let
  username = "elcuervo";
  fullname = "elcuervo";

in

{
  imports = [
    ../modules
  ];

  my = {
    username = "${username}";

    modules = {
      dock = {
        enable = true;

        entries = [
          { path = "/System/Applications/Launchpad.app"; }
          { path = "/Applications/iTerm.app"; }
          { path = "/System/Applications/Mail.app"; }
          {
            path = "/Users/${username}/Downloads/";
            section = "others";
            options = "--sort dateadded --view grid --display folder";
          }
        ];
      };

      finder = {
        enable = true;

        entries = [
          {
            path = "/Users/${username}";
            alias = "Home";
          }
          {
            path = "/Applications";
            alias = "Applications";
          }
          {
            path = "/Users/${username}/Desktop";
            alias = "Desktop";
          }
          {
            path = "/Users/${username}/Downloads";
            alias = "Downloads";
          }
          {
            path = "/Users/${username}/code";
            alias = "Code";
          }
        ];
      };
    };
  };

  users = {
    users = {
      "${username}" = {
        description = "${fullname}";
        shell = pkgs.bash;
        home = "/Users/${username}";
      };
    };
  };

  home-manager.users."${username}" = { config, ... }: {
    home = {
      homeDirectory = "/Users/${username}";

      sessionPath = [
        "$HOME/.local/bin"
      ];
    };

    programs = {
      home-manager.enable = true;

      bat.enable = true;

      bash = {
         enable = true;

         initExtra = ''
           . $HOME/.tokens
         '';

         shellAliases = {
           g = "${pkgs.git}/bin/git";
           gs = "${pkgs.git}/bin/git status";
           gp = "${pkgs.git}/bin/git pull --rebase";

           cat = "${pkgs.bat}/bin/bat";
           lg = "${pkgs.lazygit}/bin/lazygit";

           tmn = "${pkgs.tmux}/bin/tmux -S /tmp/pair new-session -s $1";
           tma = "${pkgs.tmux}/bin/tmux -S /tmp/pair attach-session -t $1";
           tml = "${pkgs.tmux}/bin/tmux -S /tmp/pair list-sessions";

           md = "mkdir -pv";

           ":q" = "exit";
         };
      };

       tmux = {
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

       };

      alacritty = import ./programs/alacritty.nix { inherit pkgs; };
      direnv = import ./programs/direnv.nix { inherit pkgs; };
      fzf = import ./programs/fzf.nix { inherit pkgs; };
      neovim = import ./programs/neovim.nix { inherit pkgs; };
      readline = import ./programs/readline.nix { inherit pkgs; };
      ssh = import ./programs/ssh.nix { inherit pkgs; };
      starship = import ./programs/starship.nix { inherit pkgs; };
    };
  };
}
