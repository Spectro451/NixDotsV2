{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    enableZshIntegration = true;
    extraPackages = with pkgs; [
      ffmpegthumbnailer
      poppler
    ];
    settings = {
      manager = {
        show_hidden = true;
        show_symlink = true;
      };
    };
    theme = {
      flavor = {
        dark = "noctalia";
        light = "noctalia";
      };
    };
  };
}
