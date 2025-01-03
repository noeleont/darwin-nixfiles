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
