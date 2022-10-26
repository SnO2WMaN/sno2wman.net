{
  # main
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    corepack.url = "github:SnO2WMaN/corepack-flake";

    npmlock2nix = {
      url = "github:nix-community/npmlock2nix";
      flake = false;
    };
    dhall-haskell = {
      url = "github:dhall-lang/dhall-haskell";
      flake = false;
    };
  };

  # dev
  inputs = {
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    devshell,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        dhall-haskell' = (import "${inputs.dhall-haskell}/nix/shared.nix") {
          inherit system nixpkgs;
        };
        pkgs = import nixpkgs {
          inherit system;
          overlays = with inputs; [
            devshell.overlay
            corepack.overlays.default
          ];
        };
        inherit (pkgs) lib;
      in {
        devShells.default = pkgs.devshell.mkShell {
          packages = with pkgs; [
            alejandra
            dprint
            treefmt
            nodejs-16_x
            (mkCorepack {
              nodejs = nodejs-16_x;
              pm = "pnpm";
            })
          ];
        };
      }
    );
}
