{ stdenv, cmake, gtest, gmock }:
stdenv.mkDerivation {
  pname = "cpp-template";
  version = "0.0.1";
  src = ./.;

  nativeBuildInputs = [ cmake ];

  checkInputs = [
    gtest
    gmock
  ];

  doCheck = true;

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];
}
