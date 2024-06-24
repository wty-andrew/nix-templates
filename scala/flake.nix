{
  inputs = {
    typelevel-nix.url = "github:typelevel/typelevel-nix";
    nixpkgs.follows = "typelevel-nix/nixpkgs";
  };

  outputs = { self, nixpkgs, typelevel-nix }:
    let
      allSystems = [ "x86_64-linux" "aarch64-linux" ];

      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f (
        import nixpkgs {
          inherit system;
          overlays = [ typelevel-nix.overlays.default ];
        }
      ));
    in
    {
      devShells = forAllSystems (pkgs: with pkgs; {
        default = devshell.mkShell {
          imports = [ typelevel-nix.typelevelShell ];
          typelevelShell = {
            jdk.package = pkgs.jdk21;
          };
        };
      });
    };
}
