{ config, pkgs, ... }:

let
  #colores bonitos
  greenDark = "3f6d4e";
  greenBright = "8bd450";
  purpleDark = "734f9a";
  purpleLight = "965fd4";
  darkBg = "4b4a52";

  #inicio seccion
  header = {
    type = "custom";
    format = "┌{\$1}{\$1}┐";
    outputColor = "90";
  };
  #fin seccion
  footer = {
    type = "custom";
    format = "└{\$1}{\$1}┘";
    outputColor = "90";
  };

  #ColorBar
  ColorBar = {
    type = "custom";
    format =
      "{##${greenDark}}  {##${greenBright}}  {##${purpleDark}}  {##${purpleLight}}  {##${darkBg}}  "
      + "{##${purpleLight}}  {##${purpleDark}}  {##${greenBright}}  {##${greenDark}}  {##${darkBg}}  "
      + "{##${greenDark}}  {##${greenBright}}  {##${purpleDark}}  {##${purpleLight}}  {##${darkBg}}  "
      + "{##${purpleLight}}  {##${purpleDark}}  {##${greenBright}}  {##${greenDark}}  {##${darkBg}}  "
      + "{##${purpleDark}} ";
  };
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "${config.home.homeDirectory}/.config/fastfetch/logo/punpun.png";
        type = "kitty";
        padding = {
          top = 2;
          left = 4;
        };
        width = 50;
      };
      ascii = {
        fallback = false;
      };
      display = {
        separator = " -> ";
        constants = [ "──────────────────────────────" ];
      };
      modules = [
        header
        {
          type = "title";
          keyWidth = 10;
        }
        footer
        ColorBar
        header
        {
          type = "os";
          key = "{icon} OS";
          keyColor = "yellow";
          format = "{pretty-name} ({arch})";
        }
        {
          type = "kernel";
          key = "│ ├";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = "│ ├󰏖";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = "│ └";
          keyColor = "yellow";
        }
        {
          type = "wm";
          key = " DE/WM";
          keyColor = "blue";
        }
        {
          type = "lm";
          key = "│ ├󰧨";
          keyColor = "blue";
        }
        {
          type = "wmtheme";
          key = "│ ├󰉼";
          keyColor = "blue";
        }
        {
          type = "icons";
          key = "│ ├󰀻";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "terminalfont";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "editor";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "wallpaper";
          key = "│ └󰸉";
          keyColor = "blue";
        }
        {
          type = "host";
          key = "󰌢 PC";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = "│ ├󰻠";
          keyColor = "green";
        }
        {
          type = "gpu";
          key = "│ ├󰍛";
          keyColor = "green";
        }
        {
          type = "disk";
          key = "│ ├";
          keyColor = "green";
        }
        {
          type = "memory";
          key = "│ ├󰑭";
          keyColor = "green";
        }
        {
          type = "uptime";
          key = "│ ├󰅐";
          keyColor = "green";
        }
        {
          type = "display";
          key = "│ └󰍹";
          keyColor = "green";
        }
        {
          type = "battery";
          key = "│ └";
          keyColor = "green";
          temp = true;
        }
        {
          type = "sound";
          key = " SND";
          keyColor = "cyan";
          format = "{name:38} ({3})";
        }
        {
          type = "player";
          key = "│ ├󰥠";
          keyColor = "cyan";
          format = "{1}";
        }
        {
          type = "media";
          key = "│ └󰝚";
          keyColor = "cyan";
        }
        footer
        ColorBar
      ];
    };
  };
}
