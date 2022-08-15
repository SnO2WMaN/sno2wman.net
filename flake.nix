{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    npmlock2nix = {
      url = "github:nix-community/npmlock2nix";
      flake = false;
    };
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
    npmlock2nix,
    flake-utils,
    devshell,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            devshell.overlay
            (self: super: {
              npmlock2nix = super.callPackage npmlock2nix {};
            })
          ];
        };
      in {
        packages.website = pkgs.npmlock2nix.build {
          src = ./.;
          installPhase = "cp -r dist $out";
          buildCommands = [
            "npm run build"
          ];
        };
        packages.default = self.packages.${system}.website;
        defaultPackage = self.packages.${system}.default;

        devShells.default = pkgs.devshell.mkShell {
          imports = [
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
        };
      }
    );
}
