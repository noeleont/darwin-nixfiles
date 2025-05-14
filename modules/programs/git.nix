{
  enable = true;
  userEmail = "noe@bespinian.io";
  userName = "Noe Thalheim";
  ignores = [
    ".idea" ".vscode" ".DS_Store" ".envrc" "shell.nix" "*.swp" "*.swo"
    "nohup.out" "tags" "tags.lock" "tags.temp" ".direnv"
  ];
  extraConfig = {
    core = {
      pager = "delta --line-numbers --dark --side-by-side";
      editor = "vim";
      whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
    };
    format = {
      pretty = "%C(blue)%h%Creset %s %C(green)%d%Creset [%C(red)%an%Creset, %C(cyan)%cr%Creset] %C(bold reverse)%N%Creset";
    };
    branch = {
      autosetuprebase = "always";
    };
    gpg = {
      program = "gpg";
    };
    commit = {
      gpgSign = true;
    };
  };
  aliases = {
    co = "checkout";
    lgb = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit --date=relative --branches";
  };
  lfs.enable = true;
}
