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
    inputs.hyprland-contrib.packages.x86_64-linux.grimblast
    wl-clipboard
    pamixer
    playerctl
  ];
  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };
}
