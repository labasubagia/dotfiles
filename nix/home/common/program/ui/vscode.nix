# Been using the "profile" feature before. It works great on several projects (especially profiles for each programming language).
# However, it becomes a hurdle when the project combines several programming languages (e.g., Go and Python, projects with Terraform, etc.)
# because of the need to edit project settings or create a new profile.
# So just define global settings for all tools and languages and disable them in each workspace if the extensions are unnecessary.

# Or, saving the "profile" configuration in the project (e.g. inside .vscode/<profile-name>.code-profile), but it still needs to be imported manually.
# When creating a new profile, all configuration is unchecked except for extensions.

{ pkgs, globalConfig, ... }:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = globalConfig.font.nerdfonts.list; })
  ];

  programs.vscode = {
    enable = true;
    extensions = (
      with pkgs.vscode-extensions; [
        editorconfig.editorconfig
        streetsidesoftware.code-spell-checker
        ms-vscode-remote.remote-containers
        aaron-bond.better-comments
        eamodio.gitlens
        usernamehw.errorlens
        johnpapa.vscode-peacock
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        gruntfuggly.todo-tree

        yzhang.markdown-all-in-one

        jnoortheen.nix-ide

        golang.go

        ms-python.python
        ms-python.vscode-pylance
        charliermarsh.ruff

        hashicorp.terraform
        redhat.ansible
      ]
      ++
      pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "devbox";
          publisher = "jetpack-io";
          version = "0.1.5";
          sha256 = "+nIeDaz1NPYFoxFVC8GQxtU1MU/sbdFETAQWzVX6LGQ=";
        }
        {
          name = "signageos-vscode-sops";
          publisher = "signageos";
          version = "0.9.1";
          sha256 = "b1Gp+tL5/e97xMuqkz4EvN0PxI7cJOObusEkcp+qKfM=";
        }
        {
          name = "signageos-vscode-sops-beta";
          publisher = "signageos";
          version = "0.9.1";
          sha256 = "p1gfMd6WgFpHJHmvBAmlpi+MH40xTnInlr6xOSFpVyI=";
        }
        {
          name = "biome";
          publisher = "biomejs";
          version = "2.3.0";
          sha256 = "GrMyXn5yfxjbUi0YuioPX137P+8TWdh5V6HC0kvLFYE=";
        }
      ]
    );
    userSettings = {
      "workbench.colorTheme" = "Default Dark+";
      "workbench.tree.indent" = 20;

      "window.customTitleBarVisibility" = "auto";
      "window.titleBarStyle" = "custom";

      "editor.fontFamily" = "'${globalConfig.font.family.code}', '${globalConfig.font.family.monospace}', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.guides.bracketPairs" = true;
      "editor.guides.bracketPairsHorizontal" = true;
      "editor.guides.highlightActiveIndentation" = true;
      "editor.linkedEditing" = true;
      "editor.formatOnSave" = true;
      "editor.renderWhitespace" = "all";
      "editor.codeActionsOnSave" = {
        "source.organizeImports" = "always";
      };
      "editor.minimap.renderCharacters" = false;
      "editor.minimap.size" = "fit";
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "on";

      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;

      # HTML
      "html.autoClosingTags" = true;

      # Typescript/Javascript
      "javascript.autoClosingTags" = true;
      "javascript.suggest.autoImports" = true;
      "javascript.updateImportsOnFileMove.enabled" = "always";

      "typescript.autoClosingTags" = true;
      "typescript.suggest.autoImports" = true;
      "typescript.updateImportsOnFileMove.enabled" = "always";

      "[javascript]" = {
        "editor.defaultFormatter" = "biomejs.biome";
        "editor.codeActionsOnSave" = {
          "quickfix.biome" = "explicit";
          "source.organizeImports.biome" = "explicit";
        };
      };

      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "diagnostics" = {
            "ignored" = [
              "unused_binding"
              "unused_with"
            ];
          };
          "formatting" = {
            "command" = [
              "nixpkgs-fmt"
            ];
          };
        };
      };

      # Go
      "go.inlayHints.assignVariableTypes" = true;
      "go.inlayHints.compositeLiteralFields" = true;
      "go.inlayHints.constantValues" = true;
      "go.inlayHints.parameterNames" = true;
      "go.inlayHints.functionTypeParameters" = true;
      "go.inlayHints.rangeVariableTypes" = true;
      "go.lintTool" = "golangci-lint";
      "go.lintOnSave" = "workspace";
      "go.lintFlags" = [
        "--fast"
      ];
      "go.formatTool" = "goimports";
      "go.formatFlags" = [
        "-local"
      ];
      "go.addTags" = {
        "tags" = "json";
        "options" = "json=omitempty";
        "promptForTags" = false;
        "transform" = "snakecase";
        "template" = "";
      };
      "[go]" = {
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "always";
          "source.fixAll" = "always";
        };
      };
      "gopls" = {
        "ui.semanticTokens" = true;
        "ui.completion.usePlaceholders" = true;
      };

      # Python
      "python.analysis.typeCheckingMode" = "basic";
      "python.analysis.inlayHints.callArgumentNames" = "all";
      "python.analysis.inlayHints.functionReturnTypes" = true;
      "python.analysis.inlayHints.variableTypes" = true;
      "python.analysis.inlayHints.pytestParameters" = true;
      "[python]" = {
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll" = "explicit";
          "source.organizeImports" = "explicit";
        };
        "editor.defaultFormatter" = "charliermarsh.ruff";
      };
      "notebook.formatOnSave.enabled" = true;
      "notebook.codeActionsOnSave" = {
        "notebook.source.fixAll" = "explicit";
        "notebook.source.organizeImports" = "explicit";
      };

      # Terraform (HCL)
      "terraform.experimentalFeatures.validateOnSave" = true;
      "terraform.languageServer.enable" = true;
      "terraform.validation.enableEnhancedValidation" = true;
      "terraform.experimentalFeatures.prefillRequiredFields" = true;
      "terraform.codelens.referenceCount" = true;
      "[terraform]" = {
        "editor.formatOnSave" = true;
      };

      # spell checker
      "cSpell.enabledFileTypes" = {
        "ansible" = true;
        "nix" = true;
      };
    };
  };
}
