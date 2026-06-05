{ config, pkgs, ... }:

{
  home.username = "k";
  home.homeDirectory = "/home/k";

  home.stateVersion = "26.05";

  home.packages = [
    pkgs.alacritty
    pkgs.zellij
    pkgs.uv
  ];

  programs.home-manager.enable = true;
}
