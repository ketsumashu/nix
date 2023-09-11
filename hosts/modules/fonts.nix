{pkgs, ...}: {
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
    ];

    fontDir.enable = true;
    enableDefaultFonts = false;
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif" "Twitter Color Emoji"];
        sansSerif = ["Noto Sans CJK JP" "Noto Sans" "Twitter Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Twitter Color Emoji"];
        emoji = ["Twitter Color Emoji"];
      };
    };
  };
}
