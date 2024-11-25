{ config, pkgs, ... }:

{
  imports = [
    ./modules/aliases.nix
    (import ./modules/packages.nix { inherit pkgs; })
  ];

  home.stateVersion = "24.11";
  home.file = {};
  home.sessionVariables = {};

  programs = {
    home-manager.enable = true;
    git = import ./modules/programs/git.nix;
    neovim = import ./modules/programs/neovim.nix { inherit pkgs; };
    tmux = import ./modules/programs/tmux.nix;
    zsh = import ./modules/programs/zsh.nix;
    direnv = import ./modules/programs/direnv.nix;
    ssh = import ./modules/programs/ssh.nix { inherit config; };
    gpg = import ./modules/programs/gpg.nix;
    # TODO: homebrew version?
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zed-editor.extensions
    # zed-editor = import ./modules/programs/zed.nix;
  };
}
