{
  description = "...";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = github:numtide/flake-utils;
    dream2nix.url = "github:nix-community/dream2nix";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, flake-utils, dream2nix, gitignore }:
    dream2nix.lib.makeFlakeOutputs {
      systems = flake-utils.lib.defaultSystems;
      config.projectRoot = ./.;
      source = gitignore.lib.gitignoreSource ./.;
    };
}