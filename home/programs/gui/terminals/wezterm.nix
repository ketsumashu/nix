{
  programs.wezterm = {
    enable = true;
  };
  home.file = {
    ".config/wezterm/wezterm.lua".source = ./wezterm.lua;
    ".config/wezterm/colors/substrata.lua".source = ./colors/substrata.lua;
  };
}
