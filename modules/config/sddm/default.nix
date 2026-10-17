{
  pkgs,
  lib,
  ...
}: let
  themeName = "makima";

  theme = import ./theme.nix;

  renderINI = lib.generators.toINI {
    mkKeyValue = key: value: ''${key}="${toString value}"'';
  };

  text = name: content: pkgs.writeText name content;

  metadata = text "metadata.desktop" ''
    [SddmGreeterTheme]
    Name=${themeName}
    Type=sddm-theme
    Version=1.1
    QtVersion=6
    MainScript=Main.qml
    ConfigFile=theme.conf
  '';

  files = {
    "Main.qml" = text "Main.qml" (import ./main.nix);
    "theme.conf" = text "theme.conf" (renderINI theme);
    "metadata.desktop" = metadata;

    "Components/Clock.qml" = text "Clock.qml" (import ./components/clock.nix);
    "Components/Input.qml" = text "Input.qml" (import ./components/input.nix);
    "Components/LoginForm.qml" = text "LoginForm.qml" (import ./components/loginForm.nix);
    "Components/SessionButton.qml" = text "SessionButton.qml" (import ./components/sessionButton.nix);
    "Components/SystemButtons.qml" = text "SystemButtons.qml" (import ./components/systemButtons.nix);
    "Components/UserAvatar.qml" = text "UserAvatar.qml" (import ./components/userAvatar.nix);

    "Assets/Hibernate.svg" = text "Hibernate.svg" (import ./assets/hibernate.nix);
    "Assets/Reboot.svg" = text "Reboot.svg" (import ./assets/reboot.nix);
    "Assets/Shutdown.svg" = text "Shutdown.svg" (import ./assets/shutdown.nix);
    "Assets/Suspend.svg" = text "Suspend.svg" (import ./assets/suspend.nix);

    "Images/background.png" = ./Images/background.png;
    "Images/avatar.jpg" = ./Images/avatar.jpg;
  };

  installCmds =
    lib.concatStringsSep "\n"
    (lib.mapAttrsToList (path: src: "install -Dm644 ${src} $dst/${path}") files);

  makima-theme = pkgs.stdenvNoCC.mkDerivation {
    pname = "sddm-theme-${themeName}";
    version = "1.1";
    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall

      dst=$out/share/sddm/themes/${themeName}

      ${installCmds}

      runHook postInstall
    '';
  };
in {
  environment.systemPackages = [
    pkgs.kasane-teto-cursors
    makima-theme
  ];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
    theme = themeName;
    autoNumlock = true;
    extraPackages = with pkgs.kdePackages; [
      qt5compat
      qtdeclarative
      qtmultimedia
      qtsvg
    ];
    settings.Theme = {
      CursorTheme = "kasane-teto-cursors";
      CursorSize = 30;
    };
  };
}
