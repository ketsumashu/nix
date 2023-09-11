{
  home = rec {
    username = "mashu";
    homeDirectory = "/home/${username}";
  };

  programs.home-manager.enable = true;
}
