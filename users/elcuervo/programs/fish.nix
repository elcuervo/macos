{ pkgs, ... }:

{
  enable = true;

  history = {
    size = 10000000;
    save = 10000000;
    extended = true;
  };

  initExtra = ''
    . $HOME/.tokens
  '';

  shellAliases = {
    g = "${pkgs.git}/bin/git";
    gs = "${pkgs.git}/bin/git status";
    gp = "${pkgs.git}/bin/git pull --rebase";

    vim = "${pkgs.neovim}/bin/nvim";
    cat = "${pkgs.bat}/bin/bat";
    lg = "${pkgs.lazygit}/bin/lazygit";

    tmn = "${pkgs.tmux}/bin/tmux -S /tmp/pair new-session -s $1";
    tma = "${pkgs.tmux}/bin/tmux -S /tmp/pair attach-session -t $1";
    tml = "${pkgs.tmux}/bin/tmux -S /tmp/pair list-sessions";

    md = "mkdir -pv";

    ":q" = "exit";
  };
}
