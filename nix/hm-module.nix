self:
{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    mkPackageOption
    mkIf
    ;

  packages = self.packages.${pkgs.stdenv.hostPlatform.system};

  cfg = config.programs.thornemacs;
in
{
  options = {
    programs.thornemacs = {
      enable = mkEnableOption "thornemacs";
      package = mkPackageOption packages "thornemacs" {
        default = "default";
        pkgsText = "thornemacs.packages.\${pkgs.stdenv.hostPlatform.system}";
      };

    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];
    xdg.configFile = mkIf cfg.installAssets {
      "emacs/assets" = {
        source = ../assets;
        recursive = true;
      };
    };
  };
}
