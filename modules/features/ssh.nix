{...}: {
  flake.homeManagerModules.ssh = {
    config,
    lib,
    ...
  }: let
    cfg = config.custom.ssh;
  in {
    options.custom.ssh = {
      enable = lib.mkEnableOption "";
    };

    config = lib.mkIf cfg.enable {
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        matchBlocks."*" = {
          addKeysToAgent = "yes";
          identitiesOnly = true;
        };
      };

      services.ssh-agent = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
