{
  description = "NixOS & homa-manager flake of mashu";

  inputs = {
    # Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
    colorscheme = (import ./colorschemes) "tokyonight-moon";
  in {
    nixosConfigurations = {
      # Desktop
      mashu = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./hosts/mashu];
      };
    };

    homeConfigurations = {
      # Desktop
      "mashu" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = {inherit inputs colorscheme;};
        modules = [./home/mashu.nix];
      };
    };

    formatter."x86_64-linux" = (import nixpkgs {system = "x86_64-linux";}).alejandra;
  };
}
