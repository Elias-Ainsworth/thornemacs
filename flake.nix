{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default-linux";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      emacs-overlay,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      perSystem =
        { system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ emacs-overlay.overlay ];
          };

          thornemacs = pkgs.callPackage ./pkgs/emacs-config.nix { inherit pkgs; };
        in
        {
          packages = {
            default = thornemacs;
            thornemacs = thornemacs;
          };

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              # Nix tools
              deadnix
              nixfmt-rfc-style
              pre-commit
              statix

              # LSPs
              lua-language-server
              nixd
            ];
          };
        };
    };
}
