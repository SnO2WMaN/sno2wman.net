{
  pkgs,
  nix-filter,
  npmlock2nix,
  ...
}: let
  config = pkgs.callPackage ../dhall {};
in
  npmlock2nix.build {
    src = with nix-filter;
      filter {
        root = ./.;
        exclude = [
          ".gitignore"
          "config.json"
          (inDirectory "dist")
          (inDirectory "node_modules")
        ];
      };
    buildCommands = [
      "cp ${config}/config.json ./config.json"
      "npm run build:prod"
    ];
    installPhase = "cp -r dist $out";
  }
