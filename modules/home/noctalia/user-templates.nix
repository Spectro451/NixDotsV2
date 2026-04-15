{ pkgs, noctalia, ... }:
let
  noctaliaShell = noctalia.packages.x86_64-linux.default;
in
{
  programs.noctalia-shell.user-templates.templates = {
    # metodo super incomodo y estupido que tuve que usar para poder tener mi paleta de colores inyectada por noctalia
    vscodium = {
      input_path = builtins.toString "${noctaliaShell}/share/noctalia-shell/Assets/Templates/code.json";
      output_path = "~/.vscode-oss/extensions/noctalia.noctaliatheme-0.0.5-universal/themes/NoctaliaTheme-color-theme.json";
    };
    nvim-base16 = {
      input_path = builtins.toString (
        pkgs.writeText "matugen-template.lua" ''
          local M = {}
          function M.setup()
            require("base16-colorscheme").setup({
              base00 = "{{colors.surface.default.hex}}",
              base01 = "{{colors.surface_container.default.hex}}",
              base02 = "{{colors.surface_container_high.default.hex}}",
              base03 = "{{colors.outline.default.hex}}",
              base04 = "{{colors.on_surface_variant.default.hex}}",
              base05 = "{{colors.on_surface.default.hex}}",
              base06 = "{{colors.on_surface.default.hex}}",
              base07 = "{{colors.on_background.default.hex}}",
              base08 = "{{colors.error.default.hex}}",
              base09 = "{{colors.tertiary.default.hex}}",
              base0A = "{{colors.secondary.default.hex}}",
              base0B = "{{colors.primary.default.hex}}",
              base0C = "{{colors.tertiary_fixed_dim.default.hex}}",
              base0D = "{{colors.primary_fixed_dim.default.hex}}",
              base0E = "{{colors.secondary_fixed_dim.default.hex}}",
              base0F = "{{colors.error_container.default.hex}}",
            })
          end
          local signal = vim.uv.new_signal()
          signal:start("sigusr1", vim.schedule_wrap(function()
            package.loaded["matugen"] = nil
            require("matugen").setup()
          end))
          return M
        ''
      );
      output_path = "~/.local/share/nvim/site/lua/matugen.lua";
      post_hook = "pkill -SIGUSR1 nvim || true";
    };
  };
}
