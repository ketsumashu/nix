{
  programs.wezterm = {
    enable = true;
  };
  home.file = {
    ".config/wezterm/wezterm.lua".source = ./wezterm.lua;
    ".config/wezterm/colors/substrata.toml".source = ./colors/substrata.toml;
  };
}
