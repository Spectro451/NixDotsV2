{
  programs.opencode = {
    enable = true;
    settings = {
      plugin = [
        "opencode-dynamic-context-pruning"
        "opencode-vibeguard"
        "opencode-morph-fast-apply"
      ];
      mcp = {
        context7 = {
          type = "remote";
          url = "https://mcp.context7.com/mcp";
        };
      };
    };
    tui = {
      theme = "tokyonight";
    };
  };
}
