{ pkgs, ... }:

{
  imports = [
    ./modules/homebrew.nix
  ];

  environment.systemPackages = [ ];

  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs.zsh.enable = true;

  system = {
    stateVersion = 4;

    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
        persistent-apps = [
          "/Applications/Safari.app"
          "/System/Applications/Mail.app"
          "/Applications/Zed.app"
        ];
        show-recents = false;
      };
      WindowManager = {
        GloballyEnabled = true;
      };
      NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
    };

    keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;


  users.users.noeleon = {
    name = "noeleon";
    home = "/Users/noeleon";
  };
}
