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

  tlaplus = vimUtils.buildVimPluginFrom2Nix {
    name = "tla";
    src = fetchgit {
      url = "https://github.com/hwayne/tla.vim";
      rev = "0d6d453a401542ce1db247c6fd139ac99b8a5add";
      sha256 = "1bfxnvx3g5679jan7v5prh7zk0f77m81g8c9ngq75nxdn20ihl7l";
    };
    dependencies = [];
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

  vim-ripgrep = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-ripgrep";
    src = fetchgit {
      url = "https://github.com/jremmen/vim-ripgrep";
      rev = "ec87af6b69387abb3c4449ce8c4040d2d00d745e";
      sha256 = "1by56rflr0bmnjvcvaa9r228zyrmxwfkzkclxvdfscm7l7n7jnmh";
    };
    dependencies = [];
  };

  repl-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "repl-vim";
    src = fetchgit {
      url = "https://github.com/ujihisa/repl.vim";
      rev = "d71c5f06da9b15d78adc41fb8f96c833b70bb4fb";
      sha256 = "1fly5axnhsywxn56xcvy2ba94iybvg90gi32ly5k7pdvpvj9pgc3";
    };
    dependencies = [];
  };

  git-messenger = vimUtils.buildVimPluginFrom2Nix {
    name = "git-messenger";
    src = fetchgit {
      url = "https://github.com/rhysd/git-messenger.vim";
      rev = "4b436f8b1c9b04b7424a732cecf8b6de81e7bfd9";
      sha256 = "0mp85kyiwqhqgbc7znv5xgi0xl23zjbbq7agv0h9m2214vbra1rp";
    };
    dependencies = [];
  };
}
