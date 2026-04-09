{...}: {
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    # formatter = pkgs.alejandra;

    devShells.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        git
        alejandra
      ];
    };
  };
}
