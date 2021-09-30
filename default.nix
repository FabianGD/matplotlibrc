{ pkgs ? import (import ./nix/sources.nix).nixpkgs {} }:

with pkgs; stdenv.mkDerivation {
  pname = "matplotlibrc";
  version = "1.0.0";

  src = nix-gitignore.gitignoreSource [ ./nix ./README.md ] ./.;

  installPhase = ''
    mkdir $out
    cp $src/matplotlibrc $out
  '';

  meta = {
    description = "Custom styles for matplotlib";
    maintainers = with lib; [ fabiangd ];
  };
}