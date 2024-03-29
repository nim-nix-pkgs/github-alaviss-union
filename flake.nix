{
  description = ''Anonymous unions in Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."union-main".dir   = "main";
  inputs."union-main".owner = "nim-nix-pkgs";
  inputs."union-main".ref   = "master";
  inputs."union-main".repo  = "union";
  inputs."union-main".type  = "github";
  inputs."union-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."union-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."union-0_1_0".dir   = "0_1_0";
  inputs."union-0_1_0".owner = "nim-nix-pkgs";
  inputs."union-0_1_0".ref   = "master";
  inputs."union-0_1_0".repo  = "union";
  inputs."union-0_1_0".type  = "github";
  inputs."union-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."union-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."union-0_1_1".dir   = "0_1_1";
  inputs."union-0_1_1".owner = "nim-nix-pkgs";
  inputs."union-0_1_1".ref   = "master";
  inputs."union-0_1_1".repo  = "union";
  inputs."union-0_1_1".type  = "github";
  inputs."union-0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."union-0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."union-0_1_2".dir   = "0_1_2";
  inputs."union-0_1_2".owner = "nim-nix-pkgs";
  inputs."union-0_1_2".ref   = "master";
  inputs."union-0_1_2".repo  = "union";
  inputs."union-0_1_2".type  = "github";
  inputs."union-0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."union-0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}