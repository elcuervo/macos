{ lib, stdenv, fetchurl, libarchive, p7zip }:
with lib;

stdenv.mkDerivation rec {
  pname = "dockutil";
  version = "3.0.2";

  src = fetchurl {
    url = "https://github.com/kcrawford/dockutil/releases/download/${version}/dockutil-${version}.pkg";
    sha256 = "sha256-F1E36nR+g+0iHWCxi3ErJW7TFTFTTN6E9nlIfTN2aP0=";
  };

  dontBuild = true;
  nativeBuildInputs = [ libarchive p7zip ];

  unpackPhase = ''
    7z x $src
    bsdtar -xf Payload~
  '';

  installPhase = ''
    mkdir -pv $out/bin
    cp "usr/local/bin/dockutil" "$out/bin/dockutil"
  '';

  meta = {
    description = "Tool for managing dock items";
    homepage = "https://github.com/kcrawford/dockutil";
    license = licenses.asl20;
    maintainers = [ "tboerger" ];
    platforms = platforms.darwin;
  };
}
