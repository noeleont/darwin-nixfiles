{ pkgs }:

{
  home.packages = with pkgs; [
    awscli2
    azure-cli
    curl
    delta
    dive
    eza
    fd
    file
    fzf
    gcc
    gimp
    gnumake
    gnupg
    go
    gopls
    jq
    k9s
    keepassxc
    kubectl
    kubernetes-helm
    nerdfonts
    nixd
    nodejs
    openssl
    opentofu
    poetry
    python312
    ripgrep
    thefuck
    tmux
    tree
    unzip
    watch
    wget
    whois
    yarn
    zip
  ];
}
