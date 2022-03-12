{ pkgs, lib, ... }:

{
  enable = true;

  plugins = with pkgs; [
    {
      name = "z";
      src = fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
        rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
        sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
      };
    }
  ];

  shellInit = lib.strings.fileContents ./fish/init.fish;

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
