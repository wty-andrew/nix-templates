{ pkgs ? import <nixpkgs> {} }: with pkgs;
mkShell {
  shellHook = ''
    export LD_LIBRARY_PATH="${stdenv.cc.cc.lib.outPath}/lib:$LD_LIBRARY_PATH"
  '';
}
