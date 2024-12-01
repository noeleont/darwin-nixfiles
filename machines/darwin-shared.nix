{ inputs, machineSpecificConfig, ... }:

{ lib, inputs, ... }:

{
  home-manager.home-manager {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${user} = lib.mkMerge [
        (import userHMConfig {
          inputs = inputs;
        })
        machineSpecificConfig
    ];
  }
}
