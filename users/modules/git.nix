{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.git;

in

{
  options = with lib; {
    my = {
      modules = {
        git = {
          enable = mkEnableOption ''
            Whether to enable git module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      home-manager.users."${config.my.username}" = { config, ... }: {
        programs = {
          git = {
            enable = true;

            userName = "elcuervo";
            userEmail = "elcuervo@elcuervo.net";

            delta.enable = true;

            aliases = {
              ci = "commit";
              di = "diff";
              st = "status";
              co = "checkout";
              br = "branch";
              pu = "push";
              pl = "pull";
              cat = "cat-file -p";
              rc = "rebase --continue";
              rs = "rebase --skip";

              unstage = "reset HEAD";
              uncommit = "reset --soft HEAD^";

              tags = "tag -l";
              branches = "branch -a";
              remotes = "remote -v";

              amend = "commit --amend -C HEAD";
            };

            ignores = [
              ".DS_Store"
              ".envrc"
            ];

            extraConfig = {
              core = {
                quotepath = false;
              };

              init = {
                defaultBranch = "main";
              };

              github = {
                user = "elcuervo";
              };

              pager = {
                branch = false;
              };

              push = {
                default = "simple";
              };

              format = {
                signoff = true;
              };
            };

            lfs = {
              enable = true;
            };
          };
        };
      };
    };
}
