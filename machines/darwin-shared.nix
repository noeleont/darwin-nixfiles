{ userEmail, ... }:
{
  home-manager.home-manager {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${user} = import userHMConfig {
      inputs = inputs;
      userEmail = userEmail;
    };
  }
}
