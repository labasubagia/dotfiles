{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    vscode

    # postman has usr problem
    # postman

    # redis insight has problem with nodejs ssl
    # try tomorrow, if fail make an issue
    # redisinsight
  ];
}
