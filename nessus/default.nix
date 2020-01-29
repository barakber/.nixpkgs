{ pkgs }:
with pkgs;
let
  # Please keep the version x.y.0.z and do not update to x.y.76.z because the
  # source of the latter disappears much faster.
  version = "8.6";

  rpath = stdenv.lib.makeLibraryPath [
    alsaLib
    atk
    at-spi2-atk
    at-spi2-core
    cairo
    cups
    curl
    dbus
    expat
    fontconfig
    freetype
    glib
    glibc
    libsecret
    libuuid

    gnome2.GConf
    gdk_pixbuf
    gtk3

    gnome3.gnome-keyring

    libnotify
    libpulseaudio
    nspr
    nss
    pango
    stdenv.cc.cc
    systemd
    libv4l

    xorg.libxkbfile
    xorg.libX11
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libXScrnSaver
    xorg.libxcb
  ] + ":${stdenv.cc.cc.lib}/lib64";

  src =
    if stdenv.hostPlatform.system == "x86_64-linux" then
      ./Nessus-8.6.0-ubuntu1110_amd64.deb
    else
      throw "Skype for linux is not supported on ${stdenv.hostPlatform.system}";

in stdenv.mkDerivation {
  pname = "nessus";
  inherit version;

  system = "x86_64-linux";

  inherit src;

  nativeBuildInputs = [
    perl
    wrapGAppsHook
    glib # For setup hook populating GSETTINGS_SCHEMA_PATH
  ];

  buildInputs = [ dpkg ];

  #----
  #dontUnpack = true;
  unpackPhase = ":";
  #----

  installPhase = ''
    mkdir -p $out
    echo $out
    dpkg -x $src $out

    ls -lR $out
    #cp -av $out/usr/* $out
    #rm -rf $out/opt $out/usr
    #rm $out/bin/nessus

    mkdir -p $out/bin
    ln -s "$out/opt/nessus/sbin/nessusd" "$out/bin/nessusd"
    ls $out/bin

    # Otherwise it looks "suspicious"
    chmod -R g-w $out
  '';

  postFixup = ''
    for file in $(find $out -type f \( -perm /0111 -o -name \*.so\* -or -name \*.node\* \) ); do
      patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$file" || true
      patchelf --set-rpath ${rpath}:$out/nessus $file || true
    done


    ## Fix the desktop link
    #substituteInPlace $out/share/applications/nessus.desktop \
      #--replace /usr/bin/ $out/bin/
  #'';

  meta = with stdenv.lib; {
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}

