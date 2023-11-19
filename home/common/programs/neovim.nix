{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # appearance
      vim-airline
      vim-devicons

      # utilities
      nerdtree
      editorconfig-vim
    ];
    extraConfig = ''
      set background=dark
      set clipboard=unnamedplus
      set cursorline
      set completeopt=noinsert,menuone,noselect
      set mouse=a
      set number
      set title
    '';
  };
}
