{
  stdenv,
  nix-filter,
  dhall-json,
}:
stdenv.mkDerivation {
  name = "config-json";
  src = with nix-filter;
    filter {
      root = ../dhall;
      exclude = [
        "*.json"
      ];
    };
  buildInputs = [dhall-json];
  buildPhase = ''
    dhall-to-json --file $src/config.dhall --output ./config.json
  '';
  installPhase = ''
    mkdir $out
    cp ./config.json $out/config.json
  '';
}
