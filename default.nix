{
	stdenv,
  fetchgit,
  raylib,
  gnutar,
	...
}: 
stdenv.mkDerivation {
  pname = "tommywiseaue";
  version="v3.0.0";

  src = fetchgit{
    #url = "https://github.com/postboy/cpwd";
    url = "https://github.com/PORNOZVEZDA/cpwd_for_nix";
    rev = "14ce3ef9cfbd977e1e3dbc348bbff9aca1dd4e44";
    sha256 = "1h7nhg7ym5rnxlahxklp4ccdyybvjhl2a594k1dic620w0dnk2zd";

  };
	builtInputs = [raylib];
  buildPhase = ''
  cd $src

  mkdir -p $out/bin
  cpwd_out=$out/bin/cpwd
  $src/build.sh
  #ls $src

  '';

  installPhase = ''
  mkdir $out/bin
  $src

  '';
}
