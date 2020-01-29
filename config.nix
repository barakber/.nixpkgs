{
  allowUnfree = true;

  packageOverrides = pkgs: rec {

    ranger = import ./ranger/default.nix { inherit pkgs; };
    neovim = import ./neovim/default.nix { inherit pkgs; };
    lynx = import ./lynx/default.nix { inherit pkgs; };
    weechat = import ./weechat/default.nix { inherit pkgs; };
    swiProlog = import ./swipl/default.nix { inherit pkgs; };
    code = import ./code/default.nix { inherit pkgs; };
    skype = import ./skype/default.nix { inherit pkgs; };
    #nessus = import ./nessus/default.nix { inherit pkgs; };
    #genson = import ./genson/default.nix { inherit pkgs; };
    #json2csv = import ./json2csv/default.nix { inherit pkgs; };

    berko = with pkgs; lib.lowPrio (buildEnv {
      ignoreCollisions = true;
      name = "berko";
      paths = with pkgs; [
        termite
        tmux

        ranger
        neovim
        lynx
        weechat
        zathura
        poppler_utils

        htop

        exa
        ripgrep
        jq
        html-xml-utils
        #genson
        #json2csv
        #pythonPackages.csvkit

        coq
        (haskell.packages.ghc844.ghcWithPackages (ps: with ps; [Agda]))
        swiProlog
        code

        skype

        #nessus
      ];
    });
  };
}
