self:
{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib)
    mkOption
    mkEnableOption
    mkIf
    ;
  inherit (lib.types)
    bool
    package
    ;

  packages = self.packages.${pkgs.stdenv.hostPlatform.system};

  cfg = config.programs.thornemacs;
in
{
  options = {
    programs.thornemacs = {
      enable = mkEnableOption "thornemacs";
      service = {
        enable = mkEnableOption "enable emacs service";
        client = mkOption {
          default = cfg.service.enable;
          description = "enable emacs client";
        };
      };
      installAssets = {
        enable = mkOption {
          type = bool;
          default = true;
          description = "install custom assets";
        };
        ascii = mkOption {
          type = bool;
          default = cfg.installAssets.enable;
          description = "install custom ascii art";
        };
        icons = mkOption {
          type = bool;
          default = cfg.installAssets.enable;
          description = "install custom icons";
        };
        images = mkOption {
          type = bool;
          default = cfg.installAssets.enable;
          description = "install custom images";
        };
        org = mkOption {
          type = bool;
          default = cfg.installAssets.enable;
          description = "install custom org templates";
        };
      };
      package = mkOption {
        type = package;
        inherit (packages) default;
      };

    };
  };
  config = mkIf cfg.enable {
    # Enable Home Manager packages
    home.packages = [ cfg.package ];

    # Emacs Shell Aliases
    home.shellAliases = {
      em = "emacs"; # Open Emacs normally
      et = "emacs -nw"; # Open Emacs in terminal
      ec = "emacsclient -c -a ''"; # Open client in a new frame
      ect = "emacsclient -t -a ''"; # Open client in terminal
      ek = "emacsclient -e '(kill-emacs)'"; # Kill the Emacs daemon
      es = "emacs --daemon"; # Start Emacs daemon
    };

    xdg.configFile = mkIf cfg.installAssets.enable {
      "emacs/ascii" = mkIf cfg.installAssets.ascii {
        source = ../assets/ascii;
        recursive = true;
      };
      "emacs/icons" = mkIf cfg.installAssets.icons {
        source = ../assets/icons;
        recursive = true;
      };
      "emacs/images" = mkIf cfg.installAssets.images {
        source = ../assets/images;
        recursive = true;
      };
      "emacs/org" = mkIf cfg.installAssets.org {
        source = ../assets/org;
        recursive = true;
      };
    };

    # Conditionally enable Emacs service
    services.emacs = mkIf cfg.service.enable {
      enable = true;
      inherit (cfg) package;
      client = {
        enable = cfg.service.client; # Enable the Emacs client (e.g., emacsclient)
      };
    };
  };
}
