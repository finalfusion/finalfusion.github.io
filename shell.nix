with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "finalfusion.github.io-bundler-env";
    inherit ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "finalfusion.github.io";
  buildInputs = [ env ];
}
