# Been using the "profile" feature before. It works great on several projects (especially profiles for each programming language).
# However, it becomes a hurdle when the project combines several programming languages (e.g., Go and Python, projects with Terraform, etc.)
# because of the need to edit project settings or create a new profile.
# So just define global settings for all tools and languages and disable them in each workspace if the extensions are unnecessary.

# Or, saving the "profile" configuration in the project (e.g. inside .vscode/<profile-name>.code-profile), but it still needs to be imported manually.
# When creating a new profile, all configuration is unchecked except for extensions.

{ pkgs, lib, config, globalConfig, ... }:

let
  configUserSettingPath = ../../../../../config/vscode/settings.json;
  configUserSetting = (builtins.fromJSON (builtins.readFile configUserSettingPath));

  configExtensionPath = ../../../../../config/vscode/extensions.json;
  configExtension = (builtins.fromJSON (builtins.readFile configExtensionPath));

  extensionsFromNixpkgs = builtins.map
    (item: pkgs.vscode-extensions.${item.publisher}.${item.name})
    (
      lib.filter
        (item: !(item ? sha256))
        configExtension.list
    );

  extensionsFromMarketplace = lib.filter (item: item ? sha256) configExtension.list;
in
{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = globalConfig.font.nerdfonts.list; })
  ];

  programs.vscode = {
    enable = true;
    extensions = (
      extensionsFromNixpkgs
      ++
      pkgs.vscode-utils.extensionsFromVscodeMarketplace extensionsFromMarketplace
    );
    userSettings = configUserSetting // {
      # Customize start here

      "editor.fontFamily" = "'${globalConfig.font.family.code}', '${globalConfig.font.family.monospace}', 'monospace', monospace";
    };
  };
}
