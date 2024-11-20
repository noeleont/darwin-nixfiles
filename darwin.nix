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

  system.stateVersion = 4;

  users.users.noeleon = {
    name = "noeleon";
    home = "/Users/noeleon";
  };
}
