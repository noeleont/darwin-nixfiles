{ ... }:

{
  homebrew = {
    enable = true;

    masApps = {
      "Tailscale" = 1475387142;
      "iA Writer" = 775737590;
      "Things 3" = 904280696;
      "Wipr 2" = 1662217862;
      "Pixelmator Pro" = 1289583905;
      Xcode = 497799835;
    };

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
  };
}
