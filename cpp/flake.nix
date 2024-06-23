{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      allSystems = [ "x86_64-linux" "aarch64-linux" ];

      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f (
        import nixpkgs {
          inherit system;
        }
      ));
    in
    {
      devShells = forAllSystems (pkgs: with pkgs; {
        default = mkShell {
          packages = [
            clang-tools
            cmake
            gdb

            gtest
            gmock
          ];

          CMAKE_EXPORT_COMPILE_COMMANDS = "ON";
        };
      });

      packages = forAllSystems (pkgs: {
        default = pkgs.callPackage ./default.nix { };
        clang = pkgs.callPackage ./default.nix { stdenv = pkgs.clangStdenv; };
      });
    };
}
