{ pkgs }:
with pkgs;
python36Packages.buildPythonApplication rec {
  name = "ranger";

  meta = {
    description = "File manager with minimalistic curses interface";
    homepage = http://ranger.nongnu.org/;
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.unix;
  };

  src = fetchgit {
    url = "https://github.com/ranger/ranger";
    rev = "3a1f942e67d5cb23a7cd139cfcd1141e19ce5c3e";
    sha256 = "0wh5pny9i88vvj1cjl98c342hxkwz7spswa7p8595rfch2mgfhaf";
  };

  checkInputs = with pythonPackages; [ pytest ];
  propagatedBuildInputs = [ file
                            w3m
                            highlight
                            atool
                            mediainfo
                            odt2txt
                            xsv
                            jq
                            binutils
                            xxd
                            git
                            poppler_utils
                          ];

  checkPhase = ''
    py.test tests
  '';

  preConfigure = ''
    cp ${scope} ranger/data/scope.sh
    substituteInPlace ranger/data/scope.sh \
      --replace "/bin/echo" "echo"

    substituteInPlace ranger/__init__.py \
      --replace "DEFAULT_PAGER = 'less'" "DEFAULT_PAGER = '${stdenv.lib.getBin less}/bin/less'"
    for i in ranger/config/rc.conf doc/config/rc.conf ; do
      substituteInPlace $i --replace /usr/share $out/share
    done
    substituteInPlace ranger/config/rc.conf \
      --replace "set preview_script ~/.config/ranger/scope.sh" "set preview_script $out/share/doc/ranger/config/scope.sh"
    substituteInPlace ranger/ext/img_display.py \
      --replace /usr/lib/w3m ${w3m}/libexec/w3m
    # give image previews out of the box when building with w3m
    substituteInPlace ranger/config/rc.conf \
      --replace "set preview_images false" "set preview_images true" \
  '';

  scope = ./scope.sh;
}
