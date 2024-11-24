# Darwin Nixfiles

## Install nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Install brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

brew is used to install GUI apps that are not available via nix packags, e.g.  `secretive`, `orbstack`, etc.

## Setup

```bash
git clone https://github.com:noeleont/darwin-nixfiles.git ~/nixfiles
cd ~/nixfiles
make [ help | rebuild | update | clean ]
```
