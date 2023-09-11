{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../modules/minimal
    ../modules/fonts.nix
    ../modules/games.nix
    ../modules/sound.nix
    ../modules/desktop/hyprland.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/";
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "mashunix"; # define your hostname
}
