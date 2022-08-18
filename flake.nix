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
        inherit (pkgs) lib;
      in {
        packages.website = pkgs.npmlock2nix.build {
          src = builtins.path {
            path = ./.;
            filter = name: type:
              (name == toString ./package.json)
              || (name == toString ./package-lock.json)
              || (name == toString ./.tsconfig.json)
              || (name == toString ./.browserslistrc)
              || (lib.hasPrefix (toString ./src) name);
          };
          installPhase = "cp -r dist $out";
          buildCommands = [
            "npm run build"
          ];
        };
        packages.default = self.packages.${system}.website;
        defaultPackage = self.packages.${system}.default;

        apps.preview = flake-utils.lib.mkApp {
          drv = with pkgs; (writeShellScriptBin "serve-preview" "${miniserve}/bin/miniserve ${self.packages.${system}.website}");
        };
        apps.default = self.apps.${system}.preview;

        devShells.default = pkgs.devshell.mkShell {
          imports = [
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
        };
      }
    );
}
