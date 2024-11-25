# Source: https://github.com/mitchellh/nixos-config/blob/main/users/mitchellh/home-manager.nix
{ inputs, userEmail, ... }:

{ config, lib, pkgs, ... }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;

  # For our MANPAGER env var
  # https://github.com/sharkdp/bat/issues/1145
  manpager = (pkgs.writeShellScriptBin "manpager" (if isDarwin then ''
    sh -c 'col -bx | bat -l man -p'
    '' else ''
    cat "$1" | col -bx | bat --language man --style plain
  ''));
in {
  home.stateVersion = "24.11";

  xdg.enable = true;

  #---------------------------------------------------------------------
  # Packages
  #---------------------------------------------------------------------

  home.packages = with pkgs; [
    awscli2
    azure-cli
    bat
    curl
    delta
    dive
    eza
    fd
    file
    fzf
    gcc
    gnumake
    gnupg
    go
    gopls
    jq
    k9s
    kind
    kubectl
    kubernetes-helm
    minikube
    nerdfonts
    nixd
    nodejs
    openssl
    opentofu
    poetry
    python312
    ripgrep
    tailscale
    thefuck
    tmux
    tree
    unzip
    watch
    wget
    whois
    yarn
    zip
  ] ++ (lib.optionals isLinux [
    chromium
    firefox
    valgrind
    zathura
  ]);

  #---------------------------------------------------------------------
  # Env vars and dotfiles
  #---------------------------------------------------------------------

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "zed";
    PAGER = "less -FirSwX";
    MANPAGER = "${manpager}/bin/manpager";
  };

  #---------------------------------------------------------------------
  # Programs
  #---------------------------------------------------------------------

  programs.gpg.enable = true;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "colored-man-pages"
        "git"
        "vi-mode"
        "thefuck"
        "sudo"
        "z"
      ];
      theme = "agnoster";
    };
    shellAliases = {
        gd = "git diff --color";
        gdf = "git diff --color --cached";
        gp = "git pull";
        gco = "git checkout";
        gs = "git status";
        gcm = "git commit -m";

        grep = "grep --color";
        tf = "tofu";
        k = "kubectl";
        la = "exa -hal";

        ".." = "cd ..";
        "..." = "cd ../..";
      };
  };

  programs.direnv= {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Noe Thalheim";
    userEmail = userEmail;
    aliases = {
      cleanup = "!git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 -r git branch -d";
      prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      root = "rev-parse --show-toplevel";
    };
    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      core.askPass = ""; # needs to be empty to use terminal for ask pass
      credential.helper = "store"; # want to make this more secure
      github.user = "noeleont";
      push.default = "tracking";
      init.defaultBranch = "main";
    };
  };

  programs.go = {
    enable = true;
    goPath = "code/go";
  };
}
