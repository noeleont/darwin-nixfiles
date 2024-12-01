{lib, ...}:
{ userEmail, editor, useGpg ? false }:
{
  enable = true;
  userEmail = userEmail;
  userName = "Noe Thalheim";
  ignores = [
    ".idea" ".vscode" ".DS_Store" ".envrc" "shell.nix" "*.swp" "*.swo"
    "nohup.out" "tags" "tags.lock" "tags.temp" ".direnv"
  ];
  extraConfig = {
    core = {
      pager = "delta --line-numbers --dark --side-by-side";
      editor = editor;
      whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
    };
    format = {
      pretty = "%C(blue)%h%Creset %s %C(green)%d%Creset [%C(red)%an%Creset, %C(cyan)%cr%Creset] %C(bold reverse)%N%Creset";
    };
    branch = {
      autosetuprebase = "always";
    };
    gpg = lib.mkIf useGpg {
        program = "gpg";
    };
    commit = lib.mkIf useGpg {
        gpgSign = true;
    };
  };
  lfs.enable = true;
}
