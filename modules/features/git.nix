{...}: {
  flake.homeManagerModules.git = {
    config,
    lib,
    ...
  }: let
    cfg = config.custom.git;
  in {
    options.custom.git = {
      enable = lib.mkEnableOption "";

      userName = lib.mkOption {
        type = lib.types.str;
      };

      userEmail = lib.mkOption {
        type = lib.types.str;
      };

      pathToSigningKey = lib.mkOption {
        type = lib.types.str;
      };
    };

    config = lib.mkIf cfg.enable {
      programs.git = {
        enable = true;
        settings = {
          user = {
            name = cfg.userName;
            email = cfg.userEmail;
            signingkey = cfg.pathToSigningKey;
          };
          gpg.format = "ssh";
          commit.gpgsign = true;
          init.defaultBranch = "main";
        };
      };
    };
  };
}
