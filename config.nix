{
  allowUnfree = true;

  packageOverrides = pkgs: rec {

    ranger = import ./ranger/default.nix { inherit pkgs; };
    neovim = import ./neovim/default.nix { inherit pkgs; };
    weechat = import ./weechat/default.nix { inherit pkgs; };
    swiProlog = import ./swipl/default.nix { inherit pkgs; };
    genson = import ./genson/default.nix { inherit pkgs; };
    #json2csv = import ./json2csv/default.nix { inherit pkgs; };

    berko = with pkgs; lib.lowPrio (buildEnv {
      ignoreCollisions = true;
      name = "berko";
      paths = with pkgs; [
        termite
        tmux

        ranger
        neovim
        weechat
        zathura

        htop

        ripgrep
        jq
        genson
        #json2csv
        #pythonPackages.csvkit

        coq
        swiProlog
      ];
    });
  };
}
