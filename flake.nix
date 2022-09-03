{
  # main
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    nix-filter.url = "github:numtide/nix-filter";
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
            nix-filter.overlays.default
            (
              final: prev: {
                # inherit
                #   (dhall-haskell')
                #   dhall-json
                #   dhall-lsp-server
                #   ;
                npmlock2nix = final.callPackage inputs.npmlock2nix {};
              }
            )
          ];
        };
        inherit (pkgs) lib;
      in {
        # packages.dhall-haskell = import inputs.dhall-haskell;
        packages.config-json = pkgs.callPackage ./dhall {};
        # packages.website = pkgs.npmlock2nix.build {
        #   src = with nix-filter.lib;
        #     filter {
        #       root = ./.;
        #       include = [
        #         "./package.json"
        #         "./package-lock.json"
        #         "./tsconfig.json"
        #         "./.browserslistrc"
        #         (inDirectory "src")
        #       ];
        #       # exclude = [];
        #     };
        #   installPhase = "cp -r dist $out";
        #   buildCommands = [
        #     "npm run build"
        #   ];
        # };
        # packages.default = self.packages.${system}.website;
        # defaultPackage = self.packages.${system}.default;

        apps.preview = flake-utils.lib.mkApp {
          drv = with pkgs; (
            writeShellScriptBin
            "serve-preview"
            "${miniserve}/bin/miniserve ${self.packages.${system}.website}"
          );
        };
        apps.default = self.apps.${system}.preview;

        devShells.default = pkgs.devshell.mkShell {
          packages = with pkgs; [
            alejandra
            dprint
            nodejs-16_x
            treefmt
            dhall
            dhall-json
            dhall-lsp-server
            deno
            taplo-cli
            cargo-make
          ];
          commands = [
            {
              package = "treefmt";
              category = "formatters";
            }
          ];
        };
      }
    );
}
