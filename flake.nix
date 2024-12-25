{
  description = "Hello, Rust!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    systems = ["x86_64-linux"];
    forAllSystems = f:
      nixpkgs.lib.genAttrs systems (system:
        f {
          pkgs = import nixpkgs {inherit system;};
        });
  in {
    packages = forAllSystems ({pkgs}: {
      default = pkgs.callPackage ./flake/package.nix {};
    });
  };
}
