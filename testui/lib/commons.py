class Commons:
    def __init__(self):
        pass

    @keyword("Create Firefox profile")
    def create_firefox_profile(self, path):
        profile_path = BuiltIn().get_variable_value("${FIREFOX_PROFILE_PATH}")
        logger.info("Profile path from path : " + str(profile_path))
        if profile_path != None:
            return profile_path;
        else:
            fp = webdriver.FirefoxProfile()
            fp.set_preference("browser.download.folderList", 2)
            fp.set_preference("browser.download.manager.showWhenStarting", False)
            fp.set_preference("browser.helperApps.neverAsk.saveToDisk", 'application/csv, application/text, application/x-tar, application/json, text/plain, */*')
            fp.set_preference("browser.download.dir", path)
            fp.set_preference('webdriver_assume_untrusted_issuer', False)
            fp.set_preference('security.insecure_field_warning.contextual.enabled', False)
            fp.set_preference('signon.autofillForms.http', False)
            fp.set_preference('marionette.actors.enabled', False)

            fp.assume_untrusted_cert_issuer = False;
            fp.accept_untrusted_certs = True;

            logger.info("PREFERENCES SET")
            fp.update_preferences()
            return fp.path