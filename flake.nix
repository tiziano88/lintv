{
  description = "lint";
  inputs = {
    # https://status.nixos.org/
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = github:oxalica/rust-overlay;
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          # overlays = [ rust-overlay.overlays.default ];
          # system = "x86_64-linux";
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
            ];
          };
      }
    ));
}
