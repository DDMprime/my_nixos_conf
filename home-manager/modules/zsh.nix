{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "bira"; # Или кастомная тема
      plugins = [ "git" "sudo" "z" ];
    };

    shellAliases = {
      g = "git";
      sl = "ls";
      #tm = "tmux";
      l = "ls -l";
      ll = "ls -lh";
      la = "ls -alh";
      cl = "clear & l";
      fucking = "sudo";
      lla = "ls -alh";
      tree = "tree";
      mkcl = "make clean";
      neofetch = "fastfetch";
      ff = "fastfetch";
    };
  };
  home.shell = "zsh"; # zsh по умолчанию
}
