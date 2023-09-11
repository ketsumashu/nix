{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./mako.nix
    ./swaylock.nix
  ];

  programs = {
    zsh.loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
  };

  home.packages = with pkgs; [
    # Wayland utility
    swayidle
    wl-clipboard
    pamixer
  ];
  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };
}
