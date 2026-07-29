{inputs, ...}: {
  imports = [inputs.zen-browser.homeModules.twilight];

  programs.zen-browser = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

      pinsForce = true;
      pinsForceAction = "demote";

      pins = {
        "GitHub" = {
          id = "2e8ed627-9fa9-4703-b9b2-befdb08aa12b";
          url = "https://github.com/";
          position = 101;
          isEssential = true;
        };
        "YouTube" = {
          id = "584ac453-ac71-4bf8-8006-f4c66c25abf0";
          url = "https://www.youtube.com/";
          position = 102;
          isEssential = true;
        };
        "Crunchyroll" = {
          id = "9dade3c3-a6e3-404a-a339-f45c207c1696";
          url = "https://www.crunchyroll.com/";
          position = 103;
          isEssential = true;
        };
        "AnimeAV1" = {
          id = "3c4271f7-489c-4bd6-be61-ea111f0ded7d";
          url = "https://animeav1.com/";
          position = 104;
          isEssential = true;
        };
      };

      userChrome = ''
        #zen-workspaces-button { display: none !important; }
        .zen-current-workspace-indicator { display: none !important; }
      '';

      settings = {
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

        "accessibility.typeaheadfind.flashBar" = 0;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;
        "general.autoScroll" = true;
        "intl.regional_prefs.use_os_locales" = true;

        "layout.css.prefers-color-scheme.content-override" = 0;

        "network.dns.disablePrefetch" = true;
        "network.http.speculative-parallel-limit" = 0;
        "network.prefetch-next" = false;

        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.userContext.enabled" = false;

        "sidebar.visibility" = "hide-sidebar";

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        "zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url" = true;
        "zen.tabs.show-newtab-button-top" = false;
        "zen.urlbar.behavior" = "float";
        "zen.view.compact.enable-at-startup" = true;
        "zen.view.compact.hide-tabbar" = false;
        "zen.view.experimental-no-window-controls" = true;
        "zen.view.window.scheme" = 0;
        "zen.workspaces.separate-essentials" = false;
        "zen.welcome-screen.seen" = true;

        "browser.newtabpage.pinned" = ''[{"url":"https://www.youtube.com/","label":"(275) YouTube","baseDomain":"youtube.com"},{"url":"https://claude.ai/","label":"Claude","baseDomain":"claude.ai"},{"url":"https://www.crunchyroll.com/","label":"crunchyroll","baseDomain":"crunchyroll.com"},{"url":"https://animeav1.com/","label":"AnimeFlv","baseDomain":"animeav1.com"},{"url":"https://github.com/","baseDomain":"github.com"},null,{"url":"https://mynixos.com/","baseDomain":"mynixos.com"},{"url":"https://www.overleaf.com/","baseDomain":"overleaf.com"}]'';
      };
    };
  };
}
