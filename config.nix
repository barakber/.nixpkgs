{
  allowUnfree = true;

  packageOverrides = pkgs: rec {

    ranger = import ./ranger-config/default.nix { inherit pkgs; };
    neovim = import ./vim-config/default.nix { inherit pkgs; };
    swiProlog = import ./swipl-config/default.nix { inherit pkgs; };
    genson = import ./genson/default.nix { inherit pkgs; };
    berko = with pkgs; lib.lowPrio (buildEnv {
      ignoreCollisions = true;
      name = "berko";
      paths = with pkgs; [
        termite
        tmux

        ranger
        neovim
        zathura

        htop

        ripgrep
        jq
        genson

        coq
        swiProlog
      ];
    });
  };
}
