{ pkgs ? import (import ./nix/sources.nix).nixpkgs {} }:

with pkgs; stdenv.mkDerivation {
  pname = "matplotlibrc";
  version = "1.2.0";

  src = builtins.path { name = "src"; path = ./src; };

  installPhase = ''
    mkdir $out
    cp $src/matplotlibrc $out
  '';

  meta = {
    description = "Custom styles for matplotlib";
    maintainers = with lib; [ fabiangd ];
  };
}
