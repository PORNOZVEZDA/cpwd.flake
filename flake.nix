{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: 
  let
  system = "x86_64-linux";
  pkgs = import nixpkgs {inherit system;};
  in
  {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.cpwd;
    packages.x86_64-linux.fzf = nixpkgs.legacyPackages.x86_64-linux.fzf;
    packages.x86_64-linux.fq = nixpkgs.legacyPackages.x86_64-linux.fq;
    packages.x86_64-linux.cpwd = pkgs.callPackage ./. {};

# this bulk expression can be substituted with:
# which will automatically pass any deps inside
  #  packages.x86_64-linux.cpwd = import ./default.nix {
  #  stdenv = pkgs.stdenv; 
  #  fetchgit = pkgs.fetchgit;
  #  raylib = pkgs.raylib;
  #  };
  };
}
