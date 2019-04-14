{ pkgs
}:
with pkgs;
python36.pkgs.buildPythonPackage rec {
  name = "genson";
  src = pkgs.fetchgit {
    url = "https://github.com/wolverdude/GenSON";
    rev = "v1.1.0";
    sha256 = "1agxf8bnj3jgk0igpdzpkvy8q4nbfljyrx61kv89bsyp2v3bixyb";
  };
}
