{ pkgs
}:
with pkgs;
vscode-with-extensions.override {
  vscodeExtensions = with vscode-extensions;
     []
  ++ vscode-utils.extensionsFromVscodeMarketplace [
       { name      = "language-haskell";
         publisher = "JustusAdam";
         version   = "2.6.0";
         sha256    = "1891pg4x5qkh151pylvn93c4plqw6vgasa4g40jbma5xzq8pygr4";
       }

       { name      = "vscode-hie-server";
         publisher = "alanz";
         version   = "0.0.28";
         sha256    = "1gfwnr5lgwdgm6hs12fs1fc962j9hirrz2am5rmhnfrwjgainkyr";
       }
     ];
}
