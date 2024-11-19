{ config }:
{
  enable = true;

  extraConfig = ''
    Host *
        IdentityAgent ${config.home.homeDirectory}/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
  '';
}
