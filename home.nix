{ config, pkgs, ... }:

{
  imports = [
    ./modules/aliases.nix
    (import ./modules/packages.nix { inherit pkgs; })
  ];

  home.stateVersion = "24.11";
  home.file = {};
  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs = {
    home-manager.enable = true;
    git = import ./modules/programs/git.nix;
    tmux = import ./modules/programs/tmux.nix;
    zsh = import ./modules/programs/zsh.nix;
    direnv = import ./modules/programs/direnv.nix;
    ssh = import ./modules/programs/ssh.nix { inherit config; };
    gpg = import ./modules/programs/gpg.nix;
    go = import ./modules/programs/go.nix;
  };
}
