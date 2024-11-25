{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    casks = [
      "raycast"
      "secretive"
      "orbstack"
      "little-snitch"
      "zed"

      "google-chrome"
      "webstorm"
      "slack"
    ];
    masApps = {
      "Tailscale" = 1475387142;
      "iA Writer" = 775737590;
      "Things 3" = 904280696;
      "Wipr 2" = 1662217862;
      "Pixelmator Pro" = 1289583905;
      Xcode = 497799835;
    };
  };

  # The user should already exist, but we need to set this up so Nix knows
  # what our home directory is (https://github.com/LnL7/nix-darwin/issues/423).
  users.users.noeleon = {
    home = "/Users/noeleon";
    shell = pkgs.zsh;
  };
}
