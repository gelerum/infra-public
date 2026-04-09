{...}: {
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "default-dev-shell";
      nativeBuildInputs = with pkgs; [
        git
        alejandra
      ];

      shellHook = ''
        echo ">> Welcome to the 'default' devShell. Tools: git, alejandra."
      '';
    };
  };
}
