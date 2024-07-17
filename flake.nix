{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, fenix, }:
    flake-utils.lib.eachDefaultSystem (system:

      let
        pkgs = nixpkgs.legacyPackages.${system};
        f = with fenix.packages.${system}; combine [
          latest.toolchain
          targets.wasm32-unknown-unknown.latest.rust-std
        ];
      in
      {
        devShells.default =
          pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              clang
              pkg-config
            ];

            packages = with pkgs; [
              # nodePackages.typescript-language-server
              # nodejs_22
              f
              trunk
              rust-analyzer
              rustfmt
            ];

            LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
            RUST_BACKTRACE = "1";
            RUST_LOG = "info,yew_testing=debug";
          };
      }


    );
}
