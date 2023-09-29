{pkgs, ...}: {
  imports = [
    ./neovim
    ./zsh
    ./direnv.nix
    ./gh.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    # Development

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
    exa # ls alternative
    duf # df alternative
    fd # find alternative
    killall # process killer
    ripgrep # grep alternative

    # Archives
    zip
    unzip
    unrar
    unar

    # Rice
    pfetch
  ];
}
