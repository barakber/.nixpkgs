{ vimUtils, fetchgit }:
{
  coquille = vimUtils.buildVimPluginFrom2Nix {
    name = "coquille";
    src = fetchgit {
      url = "https://github.com/kriw/coquille";
      rev = "e1611a6ec3c17ca8a8b7ec47d9810bfb15d00576";
      sha256 = "069hfhwfr4a460hx9x5i4vfxlbacw1vwv6jd93v6dvadpdylr5x5";
    };
  };

  minimap = vimUtils.buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "minimap";
    src = fetchgit {
      url = "https://github.com/severin-lemaignan/vim-minimap";
      rev = "65ab020961c760bc56a771ffae541fe669536f50";
      sha256 = "02sxxcancl0pwrqa208rmhva2scg6j87m8wlkam6ddbyqpwv275g";
    };
    dependencies = [];
  };

  vim-ranger = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-ranger";
    src = fetchgit {
      url = "https://github.com/francoiscabrol/ranger.vim";
      rev = "e8963d5b1ea0d42f1706bc5442290d68b0f731bd";
      sha256 = "1w2rd6rcfh59i423vbdxd6diyylddjx2pk0xbaahk6p409qjqyk1";
    };
    dependencies = [];
  };

  vim-bookmarks = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-bookmarks";
    src = fetchgit {
      url = "https://github.com/MattesGroeger/vim-bookmarks";
      rev = "3adeae10639edcba29ea80dafa1c58cf545cb80e";
      sha256 = "1ikgs5cnqs9bhr8fqan8hg14px1j331l0b51yhnx00rmj4lr44bm";
    };
    dependencies = [];
  };
}
