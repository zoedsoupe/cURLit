{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "mdsp_exercism";

  buildInputs = with pkgs; [
    go
    
    elixir

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
