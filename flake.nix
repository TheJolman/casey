{
  description = "Generic Dev Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            python313
            python313Packages.elevenlabs
            python313Packages.google-genai
            python313Packages.python-dotenv
            python313Packages.wavefile
            ffmpeg
            nodejs
          ];

          shellHook = ''
            echo "Loaded dev shell."
          '';
        };
      }
    );
}
