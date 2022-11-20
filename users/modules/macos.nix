{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.macos;

in

{
  options = with lib; {
    my = {
      modules = {
        macos = {
          enable = mkEnableOption ''
            Whether to enable macos module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      homebrew = {
        brews = [
          "mas"
        ];

        masApps = {
          # Name = App Id from the url
          "1Password 7" = 1333542190;
          "Bitwarden" = 1352778147;
          "The Unarchiver" = 425424353;
          "Gestimer" = 990588172;
          "Lightroom" = 1451544217;
          "Tailscale" = 1475387142;
          "Kindle" = 405399194;
        };
      };

      environment = {
        systemPackages = with pkgs; [
          m-cli
        ];
      };

      system = {
        defaults = {
          LaunchServices = {
            LSQuarantine = false;
          };

          NSGlobalDomain = {
            AppleMeasurementUnits = "Centimeters";
            AppleMetricUnits = 1;
            ApplePressAndHoldEnabled = true;
            AppleShowAllExtensions = false;
            AppleShowScrollBars = "Always";
            AppleTemperatureUnit = "Celsius";
            NSAutomaticCapitalizationEnabled = false;
            NSAutomaticDashSubstitutionEnabled = false;
            NSAutomaticPeriodSubstitutionEnabled = false;
            NSAutomaticQuoteSubstitutionEnabled = false;
            NSAutomaticSpellingCorrectionEnabled = false;
            NSDisableAutomaticTermination = false;
            NSDocumentSaveNewDocumentsToCloud = false;
            NSNavPanelExpandedStateForSaveMode = true;
            NSNavPanelExpandedStateForSaveMode2 = true;
            NSScrollAnimationEnabled = false;
            NSTableViewDefaultSizeMode = 2;
            NSTextShowsControlCharacters = true;
            NSUseAnimatedFocusRing = false;
            PMPrintingExpandedStateForPrint = true;
            PMPrintingExpandedStateForPrint2 = true;
            "com.apple.mouse.tapBehavior" = 1;
            "com.apple.swipescrolldirection" = true;
            "com.apple.trackpad.enableSecondaryClick" = true;
            "com.apple.trackpad.trackpadCornerClickBehavior" = 1;
          };

          SoftwareUpdate = {
            AutomaticallyInstallMacOSUpdates = true;
          };

          dock = {
            autohide = true;
            autohide-delay = "0.2";
            mineffect = "scale";
            show-recents = false;
            tilesize = 64;

            wvous-tl-corner = 2;
            wvous-bl-corner = 3;
            wvous-tr-corner = 2;
            wvous-br-corner = 3;
          };

          finder = {
            AppleShowAllExtensions = false;
            FXEnableExtensionChangeWarning = false;
            QuitMenuItem = true;
            _FXShowPosixPathInTitle = true;
          };

          loginwindow = {
            DisableConsoleAccess = true;
            GuestEnabled = false;
            PowerOffDisabledWhileLoggedIn = true;
            RestartDisabledWhileLoggedIn = true;
            ShutDownDisabledWhileLoggedIn = true;
            SHOWFULLNAME = true;
          };

          screencapture = {
            location = "/Users/${config.my.username}/Pictures/Screenshots";
          };

          trackpad = {
            ActuationStrength = 1;
            Clicking = true;
            FirstClickThreshold = 1;
            SecondClickThreshold = 1;
            TrackpadRightClick = true;
            TrackpadThreeFingerDrag = true;
          };
        };
      };
    };
}
