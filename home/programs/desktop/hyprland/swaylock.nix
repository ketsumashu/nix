{
  pkgs,
  ...
}: let
  image = "solar_system.jpg";
in {
  home.packages = [pkgs.swaylock-effects];
  home.file.".config/swaylock/config".source =./swaylockconfig;
  home.file.".config/swayidle/config".source =./swayidleconfig;
}
