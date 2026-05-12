{
  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "never";
      DNSOverHTTPS = {
        Enabled = true;
        Fallback = false;
        Locked = true;
      };
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        SuspectedFingerprinting = true;
        BaselineExceptions = false;
        ConvenienceExceptions = false;
      };
      ExtensionSettings =
        let extension = { short_id, uuid }:
          {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${short_id}/latest.xpi";
              installation_mode = "force_installed";
              private_browsing = true;
            };
          };
        in builtins.listToAttrs (map extension [
          { short_id = "iceberg-darker"; uuid = "{11987003-9435-4f9d-919e-8720ebb6a64b}"; }
          { short_id = "istilldontcareaboutcookies"; uuid = "idcac-pub@guus.ninja"; }
          { short_id = "ublock-origin"; uuid = "uBlock0@raymondhill.net"; }
          { short_id = "youtube-nonstop"; uuid = "{0d7cafdd-501c-49ca-8ebb-e3341caaa55e}"; }
        ]);
      ExtensionUpdate = true;
      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        Snippets = false;
        Locked = true;
      };
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };
      GenerativeAI = {
        Enabled = false;
        Locked = true;
      };
      HttpsOnlyMode = "force_enabled";
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      PasswordManagerEnabled = false;
      Permissions.Notifications = {
        BlockNewRequests = true;
        Locked = true;
      };
      PictureInPicture = {
        Enabled = false;
        Locked = true;
      };
      PopupBlocking = {
        Default = true;
        Locked = true;
      };
      SanitizeOnShutdown = {
        Cache = false;
        Cookies = false;
        Downloads = false;
        FormData = true;
        History = false;
        Sessions = false;
        SiteSettings = false;
        OfflineApps = false;
        Locked = true;
      };
      SearchBar = "unified";
      SearchEngines = {
        Default = "DuckDuckGo";
        DefaultPrivate = "DuckDuckGo";
        PreventInstalls = true;
      };
      SearchSuggestEnabled = true;
      SkipTermsOfUse = true;
      TranslateEnabled = false;
    };
    profiles."jona" = {
      id = 0;
      settings = {
        "accessibility.typeaheadfind.enablesound" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.eme.ui.enabled" = true;
        "browser.ml.enable" = false;
        "browser.ml.linkPreview.enabled" = false;
        "browser.ml.pageAssist.enabled" = false;
        "browser.ml.smartAssist.enabled" = false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.sessionstore.resume_from_crash" = false;
        "browser.startup.couldRestoreSession.count" = 0;
        "browser.tabs.inTitlebar" = 1;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.quickactions" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.warnOnQuit" = false;
        "browser.warnOnQuitShortcut" = false;
        "extensions.activeThemeID" = "{11987003-9435-4f9d-919e-8720ebb6a64b}";
        "findbar.highlightAll" = true;
        "font.default.x-western" = "sans-serif";
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.transition.timeout" = 0;
        "full-screen-api.warning.timeout" = 0;
        "layout.spellcheckDefault" = 0;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "media.eme.enabled" = true;
        "network.cookie.cookieBehavior" = 5;
        "nglayout.initialpaint.delay" = 0;
        "privacy.globalprivacycontrol.enabled" = true;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "sidebar.main.tools" = "history,bookmarks";
        "widget.gtk.libadwaita-colors.enabled" = false;
      };
    };
  };
}
