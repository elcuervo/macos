{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.hammerspoon;

in

{
  options = with lib; {
    my = {
      modules = {
        hammerspoon = {
          enable = mkEnableOption ''
            Whether to enable hammerspoon module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        casks = [
          "hammerspoon"
        ];
      };

      home-manager.users."${config.my.username}" = { config, ... }: {
        home = {
          file = {
            ".hammerspoon/init.lua" = {
              executable = true;
              text = ''
                hs.hotkey.bind({"cmd", "shift"}, "R", function()
                  hs.reload()
                end)
                hs.alert.show("Config loaded")

                hs.hotkey.bind("cmd", 'return', function()
                  hs.application.launchOrFocus("iTerm")
                end)

                hs.hotkey.bind("cmd", '1', function()
                  hs.application.launchOrFocus("iTerm")
                end)

                hs.hotkey.bind("cmd", '2', function()
                  hs.application.launchOrFocus("Safari")
                end)

                hs.hotkey.bind("cmd", '3', function()
                  hs.application.launchOrFocus("Slack")
                end)

                hs.hotkey.bind("cmd", '4', function()
                  hs.application.launchOrFocus("Telegram")
                end)
              '';
            };
          };
        };
      };
    };
}
