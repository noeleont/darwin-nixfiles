{ config, pkgs, lib, ... }: {
  imports = [
    ./darwin-shared.nix { userEmail = "noe@bespinian.io"; }
  ];
}
