
# matplotlibrc: Custom matplotlib styles

This repo is thought as a shell hook for [nix shells](https://nixos.org/manual/nix/unstable/command-ref/nix-shell.html) to allow plotting from different repos to share a common plotting style.

## Installing via [`niv`](https://github.com/nmattia/niv)

The preferred way to install the package is to use `niv` as version manager:

```bash
# If niv is not set up yet (using the nixpkgs-unstable branch)
nix-shell -p niv --run "niv init -b nixpkgs-unstable"

# Add the repo and update all packages
nix-shell -p niv --run "niv add FabianGD/matplotlibrc && niv update"
```

## Use as shell hook

To enable this, use the following example integrations using `niv` in your `shell.nix` file:

```nix
let
  sources = import ./nix/sources.nix
  pkgs = import sources.nixpkgs { };
  matplotlibrc = import sources.matplotlibrc { inherit pkgs; };

in
stdenv.mkShell {
  # ...
  buildInputs = [
    # ...
    matplotlibrc
  ];
  shellHook = ''
    export MATPLOTLIBRC=${matplotlibrc}
  '';
}
```
