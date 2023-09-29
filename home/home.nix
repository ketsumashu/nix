{
  home = rec {
    username = "mashu";
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
