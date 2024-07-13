{ pkgs, ... }:

{
  programs.mise = {
    enable = true;
    globalConfig = {
      tools = {
        bun = "latest";
      };
    };
  };
}
