{pkgs, ...}: {
  home.packages = with pkgs; [spotify];

  # Spotify TUI
  programs.ncspot = {
    enable = true;
  };
}
