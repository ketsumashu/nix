{pkgs, ...}: {
  imports = [
    ./neovim
    ./zsh
    ./direnv.nix
    ./gh.nix
    ./git.nix
  ];

  home.packages = with pkgs; [

    # C
    gcc

    # JS/TS (Deno)
    deno

    # JS/TS (Node)
    nodejs-slim
    nodePackages.pnpm
    nodePackages.vercel
    nodePackages.wrangler

    # Python
    python312

    # Utilities
    bat # cat alternative
    bottom # top alternative
    exa # ls alternative
    du-dust # du alternative
    duf # df alternative
    fd # find alternative
    killall # process killer
    procs # ps alternative
    ripgrep # grep alternative

    # Archives
    zip
    unzip
    unrar
    unar

    # Rice
    neofetch
    pfetch
  ];
}
