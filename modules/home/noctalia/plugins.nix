{ ... }:
{
  programs.noctalia.settings.plugins = {
    enabled = [ "noctalia/wallhaven" ];
    auto_update = true;
    source = [
      {
        name = "official";
        kind = "git";
        location = "https://github.com/noctalia-dev/official-plugins";
      }
    ];
  };
}
