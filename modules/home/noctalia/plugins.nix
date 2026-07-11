{ ... }:
{
  programs.noctalia.settings.plugins = {
    enabled = [ "noctalia/wallhaven" ];
    source = [
      {
        name = "official";
        kind = "git";
        location = "https://github.com/noctalia-dev/official-plugins";
        auto_update = true;
      }
    ];
  };
}
