{
  description = "Flake for Blog";
  inputs = {
    pkgs.url = "pkgs";
  };
  outputs = {
    self,
    pkgs,
  }: {
    formatter.x86_64-linux = pkgs.legacyPackages.x86_64-linux.alejandra;
    devShells.x86_64-linux.default = pkgs.legacyPackages.x86_64-linux.mkShell {
      packages = [
        pkgs.legacyPackages.x86_64-linux.nodejs
      ];
    };
  };
}
