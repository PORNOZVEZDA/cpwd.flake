{
  description = "basic flake for cpwd utility";

  outputs = { self, nixpkgs }: 
  let
  system = "x86_64-linux";
  pkgs = import nixpkgs {inherit system;};
  in
  {
    ## examples from nixpkgs
    #packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    #packages.x86_64-linux.fzf = nixpkgs.legacyPackages.x86_64-linux.fzf;
    #packages.x86_64-linux.fq = nixpkgs.legacyPackages.x86_64-linux.fq;


    ## this command does import default.nix and automatically
    ## pass it all dependencies
    ## could be substitued with much more verbose 
    ## 
     #  packages.x86_64-linux.cpwd = import ./default.nix {
     #  stdenv = pkgs.stdenv; 
     #  fetchgit = pkgs.fetchgit;
     ## <everything else>...
     #  };
    packages.x86_64-linux.cpwd = pkgs.callPackage ./. {};
    packages.x86_64-linux.default = self.packages.x86_64-linux.cpwd;
  };
}
