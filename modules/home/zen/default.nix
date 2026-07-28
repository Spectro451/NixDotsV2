{inputs, ...}: {
  imports = [inputs.zen-browser.homeModules.twilight];

  programs.zen-browser = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

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

        "browser.newtabpage.pinned" = ''[{"url":"https://www.youtube.com/","label":"(275) YouTube","baseDomain":"youtube.com"},{"url":"https://claude.ai/","label":"Claude","baseDomain":"claude.ai"},{"url":"https://www.crunchyroll.com/","label":"crunchyroll","baseDomain":"crunchyroll.com"},{"url":"https://animeav1.com/","label":"AnimeFlv","baseDomain":"animeav1.com"},{"url":"https://github.com/","baseDomain":"github.com"},null,{"url":"https://mynixos.com/","baseDomain":"mynixos.com"},{"url":"https://www.overleaf.com/","baseDomain":"overleaf.com"}]'';
      };
    };
  };
}
