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
      service = mkEnableOption "emacs service";
      package = mkPackageOption packages "thornemacs" {
        default = "default";
        pkgsText = "thornemacs.packages.\${pkgs.stdenv.hostPlatform.system}";
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

    xdg.configFile = mkIf cfg.installAssets {
      "emacs/assets" = {
        source = ../assets;
        recursive = true;
      };
    };

    # Conditionally enable Emacs service
    services.emacs = mkIf cfg.service.enable {
      enable = true;
      package = cfg.package;
      client = {
        enable = true; # Enable the Emacs client (e.g., emacsclient)
      };
    };
  };
}
