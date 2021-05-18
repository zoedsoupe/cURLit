{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  elixirDrv = elixir.override {
    version = "1.12.0-rc.1";
    rev = "4c6f393bd0484795c020d4a6fa0a7bc7de1b9102";
    sha256 = "1y8fbhli29agf84ja0fwz6gf22a46738b50nwy26yvcl2n2zl9d8";
  };
in mkShell {
  name = "mdsp_exercism";

  buildInputs = [
    go
    
    elixirDrv

    nodejs-16_x

    python39

    ghc
    stack

    ruby_3_0
  
    # terminal stuff
    readline
    curl
  ] ++ lib.optional stdenv.isLinux [ 
        inotify-tools 
        # BEAM observer gtk engine
        gtk-engine-murrine 
      ]
    ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
        CoreFoundation
        CoreServices
      ]);

  shellHook = ''
    echo "WELCOME TO cURLit!"
  '';
}
