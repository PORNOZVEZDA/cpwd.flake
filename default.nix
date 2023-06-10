{
	stdenv,
        fetchgit,
        xclip,
	makeWrapper,
	lib,
	...
}: 
stdenv.mkDerivation {
  pname = "cpwd";
  version="0.0.1";

  src = fetchgit{
    #url = "https://github.com/postboy/cpwd";
    url = "https://github.com/PORNOZVEZDA/cpwd_for_nix";
    rev = "14ce3ef9cfbd977e1e3dbc348bbff9aca1dd4e44";
    sha256 = "1h7nhg7ym5rnxlahxklp4ccdyybvjhl2a594k1dic620w0dnk2zd";
  };
  nativeBuildInputs = [xclip makeWrapper];

  ## this variable is not needed to use xclip in runtime..
  #buildInputs = [xclip makeWrapper];
  buildPhase = ''
  export PATH=$PATH:/$xclip/bin
  cd $src
  mkdir -p $out/bin
  cpwd_out=$out/bin/cpwd
  $src/build.sh $cpwd_out

  '';

  installPhase = ''
  # there could be step with copying compiled binary to $out/bin/out name
  # but we already do it during build step.
  '';

# specify runtime dependency on xclip for cpwd. Won't find it otherwise
  postFixup = ''
  wrapProgram $out/bin/cpwd --prefix PATH : ${lib.makeBinPath [xclip]}
'';
}
