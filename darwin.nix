{ pkgs, ... }:

{
  imports = [
    ./modules/homebrew.nix
  ];

  environment.systemPackages = [ pkgs.nvim-pkg ];

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
        show-recents = false;
      };
      NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
    };

    keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;


  users.users.noeleon = {
    name = "noeleon";
    home = "/Users/noeleon";
  };
}
