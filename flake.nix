{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system: with nixpkgs.legacyPackages.${system}; {
        packages.default = pkg;
        devShells.default = mkShell {
          buildInputs = [
            nixfmt-rfc-style
            nodePackages.prettier
          ];
        };
      }
    );
}
