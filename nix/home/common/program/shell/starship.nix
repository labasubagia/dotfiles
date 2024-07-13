{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      battery.display = [
        {
          threshold = 10;
          style = "bold red";
        }
        {
          threshold = 20;
          style = "bold #FFA500";
        }
        {
          threshold = 30;
          style = "bold yellow";
        }
      ];

      # Icon changes only
      aws.symbol = " ";
      directory.read_only = " ";
      docker_context.symbol = " ";
      gcloud.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      git_branch.symbol = " ";
      hg_branch.symbol = " ";
      golang.symbol = " ";
      nodejs.symbol = " ";
      package.symbol = "󰏗 ";
      python.symbol = " ";
      rust.symbol = " ";
      terraform.symbol = "󱁢";
    };
  };
}
