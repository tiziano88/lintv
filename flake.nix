{
  description = "lintv";
  inputs = {
    # https://status.nixos.org/
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        formatter = pkgs.nixpkgs-fmt;
        defaultPackage =
          pkgs.stdenv.mkDerivation {
            name = "build";
            src = self;
            buildPhase = "echo fo";
          };
        devShell =
          pkgs.mkShell {
            buildInputs = [
              # pkgs.cargo
              pkgs.protobuf
              pkgs.trunk
              pkgs.just
              pkgs.nixpkgs-fmt
              pkgs.tailwindcss
              pkgs.nodejs
              # pkgs.wrangler
            ];
          };
      }
    ));
}
