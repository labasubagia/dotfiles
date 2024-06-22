# Been using the "profile" feature before. It works great on several projects (especially profiles for each programming language).
# However, it becomes a hurdle when the project combines several programming languages (e.g., Go and Python, projects with Terraform, etc.)
# because of the need to edit project settings or create a new profile.
# So, for now, just define global settings for all tools and languages and disable them in each workspace if the extensions are unnecessary.

{ pkgs, global-config, ... }:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = global-config.font.nerdfonts.list; })
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
      ]
    );
    userSettings = {
      "workbench.colorTheme" = "Default Dark+";

      "window.customTitleBarVisibility" = "auto";
      "window.titleBarStyle" = "custom";

      "editor.fontFamily" = "'${global-config.font.family.code}', '${global-config.font.family.monospace}', 'monospace', monospace";
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
    };
  };
}
