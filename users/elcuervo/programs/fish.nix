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

    {
      name = "tide";
      src = fetchFromGitHub {
        owner = "IlanCosman";
        repo = "tide";
        rev = "3787c725f7f6a0253f59a2c0e9fde03202689c6c";
        sha256 = "sha256-kqbdI69zVjNTi5vbz3sMcGDPXi6ueyqd628FgcOK+gM=";
      };
    }
  ];

  shellInit = lib.strings.fileContents ./fish/init.fish;

  shellAliases = {
    g = "${pkgs.git}/bin/git";
    gs = "${pkgs.git}/bin/git status";
    gp = "${pkgs.git}/bin/git pull --rebase";

    ls = "exa --icons";
    ll = "exa -l -a --icons";

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
