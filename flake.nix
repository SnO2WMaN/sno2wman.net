{
  # main
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    corepack = {
      url = "github:SnO2WMaN/corepack-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , ...
    } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        inherit (pkgs) lib;
        pkgs = import nixpkgs {
          inherit system;
          overlays = with inputs; [
            devshell.overlays.default
            corepack.overlays.default
          ];
        };
      in
      {
        devShells.default = pkgs.devshell.mkShell {
          packages = with pkgs; [
            alejandra
            nodejs-16_x
            httpie
          ];
          env = [
            {
              name = "PATH";
              prefix = "$PRJ_ROOT/node_modules/.bin";
            }
          ];
        };
      }
    );
}
