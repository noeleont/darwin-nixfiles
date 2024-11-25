{ pkgs, ... }:

{

  users.users.noeleon = {
    isNormalUser = true;
    home = "/home/noeleon";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMrb3w8ACOuU4Pzk0JlEOLPzUDbcEDBLMR6dFgt5q+hY18T2vLi2NCKgZUgQi6BdYiSwmxw0UJHlyfo5DN7jPbU= Air"
    ];
  };
}
