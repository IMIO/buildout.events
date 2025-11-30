1.6.6 (unreleased)
------------------

- imio.smartweb.locales 1.1.30 => 1.1.34

    - Update/Add translations
      [boulch]

- imio.smartweb.common 1.2.41

    - IAK-77 : IPA : Change icon with omnia set
      [thomlamb]

    - IAK-77 : IPA : Add new header to queries + some Refactoring
      [boulch]

    - IAK-77 : IPA : Add IA buttons to TinyMCE + fix payload
      [boulch]

- imio.events.core 1.2.44

    - SUP-38561 : Refactored deletion checks: ignore news items when counting
      apply restriction only to news folders or folders containing items.
      [boulch]

    - Migrate to Plone 6.1.3
      [boulch]

- imio.smartweb.common 1.2.40

    - Catch Exception on geocoding to avoid blocking content creation
      if geopy service is down
      [remdub]


1.6.5 (2025-11-05)
------------------

- pas.plugins.kimug 1.4.0

    - Upgrade dev environment to Plone 6.1.3
      [remdub]

    - WEB-4322 : Override views related to user management
      We no longer create or modify users in Plone
      This is now handled by Keycloak
      [remdub]

    - Remove deprecated methods related to redirect uris
      We are not using those methods anymore since 1.3.0
      [remdub]


1.6.4 (2025-11-03)
------------------

- imio.smartweb.common 1.2.39

    - Migration to Plone 6.1.3
      [boulch]

- Migrate to Plone 6.1.3
  [boulch]


1.6.3 (2025-09-30)
------------------

- pas.plugins.kimug 1.3.1

    - Do not gave administrator role for users in group iA.Smartweb.
      [bsuttor]

- pas.plugins.kimug 1.3.0

    - Skip OIDC settings configuration when Plone site or OIDC plugin is unavailable
      [remdub]

    - Set "came_from" session variable from HTTP_REFERER instead of came_from request.
      [bsuttor]

    - In controlpanel status, check if the redirect_uris set in Keycloak match the ones set in the OIDC plugin.
      [remdub]

    - Set OIDC settings from environment variables on instance boot
      [remdub, bsuttor]

- pas.plugins.kimug 1.2.0

    - Add controlpanel
      [remdub]

    - Add a view to set OIDC settings
      [remdub]

    - Add a view to import Keycloak users to Plone.
      [bsuttor]

- imio.smartweb.common 1.2.38

    - @find : Process None value in a field or ["None", "other value"] for agatha stats
      [boulch]

    - Add plone.app.caching include for futur proofing override
      [jchandelle]


1.6.2 (2025-09-09)
------------------

- pas.plugins.kimug 1.1.5

    - Upgrade-step to clean authentic users
      [remdub]


1.6.1 (2025-09-08)
------------------

- imio.events.core 1.2.43

    - SUP-46571: Correct handling of "min" range for event recurrences
      [boulch]

    - CITI-10 : Add (de) translation for event_public taxonomy and for event types vocabulary
      [boulch]

- pas.plugins.imio 3.0.0

    - Rename views to legacy
      So we avoid calling them by mistake.
      [remdub]

    - Remove usergroups_useroverview override
      [remdub]

- imio.smartweb.common 1.2.37

    - Add new @find endpoint to find content in instance
      [boulch]


1.6.0 (2025-08-29)
------------------

- imio.events.policy 1.1.7

    - KEYC-23 : Add upgrade step to install kimug
      [bsuttor]


1.5.7 (2025-07-10)
------------------

- imio.events.core 1.2.42

    - CITI-10 : Add new translated (de) vocabularies for e-guichet
      [boulch]

- imio.events.core 1.2.41

    - SUP-45754 : Fix (another) bug when we get whole day events
      [boulch]


1.5.6 (2025-06-25)
------------------

- imio.smartweb.common 1.2.36

    - WEB-4278 : Create translated (de) iam vocabulary for e-guichet (citizen project)
      [boulch]

    - WEB-4278 : Create translated (de) topics vocabulary for e-guichet (citizen project)
      [boulch]

    - WEB-4269 : Add Horizontal Rule option to the insert menu in TinyMCE
      [remdub]

- imio.events.core 1.2.40

    - WEB-4278 : Create translated (de) collective.taxonomy.event_public taxonomy as EventPublicDe vocabulary for e-guichet (citizen project)
      [boulch]

    - SUP-45270 : Don't set end date when undetermined end date is set to True (open_end property)
      [boulch]


1.5.5 (2025-06-16)
------------------

- imio.events.core 1.2.39

    - CITI-8 : Fix images for citizen space in e-guichet
      [boulch]


1.5.4 (2025-06-11)
------------------

- imio.events.core 1.2.38

    - WEB-4251 : Fix bug when we get a whole day event. On the day, these events don't appear!
      [boulch]


1.5.3 (2025-05-27)
------------------

- imio.events.core 1.2.37

    - WEB-4270 : Mark event as dirty when modifying selected agendas
      Ensures that initial values in the TranslatedAjaxSelectWidget are correctly updated
      [remdub]


1.5.2-quick (2025-05-27)
------------------------

- imio.events.core 1.2.36

    - WEB-4264 : Fix has_leadmage metadata_field
      [boulch]


1.5.1 (2025-05-26)
------------------

- imio.smartweb.common 1.2.35

    - CITI-7 : Fix retrieving mimeType for some picture files
      [boulch]

- imio.smartweb.common 1.2.34

    - WEB-4258 : Temporary CSS fix to unhide the "External link" tab when adding a new link.
      This a temporary fix while waiting for a new release in imio_smartweb_themes
      [remdub]

- imio.smartweb.common 1.2.33

    - WEB-4259 : Override plone.volto summary_serializer_metadata to solve a problem with new
      metadata fields being added to the summary serializer and breaking our search endpoints
      [bsuttor, remdub]

- imio.smartweb.common 1.2.32

    - WEB-4250 : Quick fix : Since Plone 6.1, AjaxSelectWidget is displaying in edit mode even if mode is "display"
      [boulch]

- imio.smartweb.locales 1.1.30

    - WEB-4260 : Override default Plone translation for TinyMCE "Insert link"
      We don't allow to upload files through the TinyMCE editor, so we don't need this
      [remdub]


1.5 (2025-05-20)
----------------

- imio.events.core 1.2.35

    - Use fullobjects=1 when we want to get only one event
      [boulch]

- imio.events.core 1.2.34

    - WEB-4234  : Fix LookupError when querying on events without fullobjects=1 in querystring
    (old/bad occurences refer to old event UID)
    [boulch]

- imio.smartweb.locales 1.1.29

    - Update dev environment to Plone 6.1-latest
      [remdub]

- imio.smartweb.common 1.2.31

    - Dirty css fix to hide the "Upload" button in the new pat-contentbrowser
      [remdub]

- imio.smartweb.common 1.2.30

    - Upgrade missing TinyMCE settings to version 7
      [remdub]

- imio.smartweb.common 1.2.29

    - Upgrade TinyMCE settings to version 7
      [remdub]

- imio.smartweb.common 1.2.28

    - Upgrade dev environment to Plone 6.1-latest
      [remdub]

    - Add tests for Plone 6.1-latest and add Python 3.13
      [remdub]

- imio.events.core 1.2.33

    - Upgrade dev environment to Plone 6.1.1
      [boulch]

    - Update Python classifiers to be compatible with Python 3.13
      [boulch]

    - Update Python classifiers to be compatible with Python 3.12
      [boulch]

    - WEB-4234  : Avoid using fullobjects in events endpoint. Increase events time caching. Reduce b_size.
      [boulch]

- imio.events.policy 1.1.6

    - Upgrade dev environment to Plone 6.1.1
      [remdub]

    - Update Python classifiers to be compatible with Python 3.13
      [remdub]

    - Update Python classifiers to be compatible with Python 3.12
      [remdub]

    - Migrate to Plone 6.0.14
      [boulch]

- collective.upgrade (plone61 branch)

    - Portal_properties is no longer a persistent tool (Plone 6.1 compatibility)
      [bsuttor]

- zope.session 5.1

    - Python 3.10, 3.11 compatibility
      For more details, see : https://raw.githubusercontent.com/zopefoundation/zope.session/refs/heads/master/CHANGES.rst

- z3c.unconfigure 2.1

    - Python 3.12, 3.13 compatibility
      For more details, see : https://raw.githubusercontent.com/zopefoundation/z3c.unconfigure/refs/heads/master/CHANGES.rst

- z3c.jbot 2.2

    - Drop support for Python 3.8
      For more details, see : https://raw.githubusercontent.com/zopefoundation/z3c.jbot/refs/heads/master/CHANGES.rst

- RelStorage 4.1.1

    - Python 3.13 compatibility
      For more details, see : https://raw.githubusercontent.com/zodb/relstorage/refs/heads/master/CHANGES.rst

- psycopg2 2.9.10

    - Python 3.13 compatibility
      For more details, see : https://raw.githubusercontent.com/psycopg/psycopg2/refs/heads/master/NEWS

- plone.gallery 1.1.6

    - For more details, see : https://raw.githubusercontent.com/plone/plone.gallery/refs/heads/master/CHANGES.rst

- pas.plugins.authomatic 2.0.0rc3

    - Pinned new version for Plone 6.1 compatibility
      For more details, see : https://raw.githubusercontent.com/collective/pas.plugins.authomatic/refs/heads/main/CHANGELOG.md

- pas.plugins.imio 2.1

    - Plone 6.1 compatibility.
      [remdub]


1.4.11 (2025-05-12)
-------------------

- imio.events.core 1.2.32

    - WEB-4234 : Refactor agenda subscription (so => events indexing). Try to avoid latency
      [boulch]

    - Add some logs
      [boulch]


1.4.10 (2025-03-30)
-------------------

- imio.events.core 1.2.31

    - WEB-4234 : Continue refactoring endpoint. Correct a bug with batching.
      [boulch]

- imio.events.core 1.2.30

    - Refactor events endpoint. Try to improve performances : Enhance cache management, 
      less dates transformations, Use a generator to get occurrences,Remove deepcopy to manage occurrences,...
      [boulch]


1.4.9 (2025-03-19)
------------------

- imio.smartweb.common 1.2.27

    - WEB-4122 : Create adapter/validator to filter valid image mimetype in our solutions
      [boulch]

- imio.smartweb.common 1.2.26

    - WEB-4212: Fixe i18n:domain for skip to content
      [thomlamb]

- imio.smartweb.common 1.2.25

    - WEB-4232 : Fix JQuery.
      Version 1.2.24 contained issues affecting the smooth running of the preventing deletion of a taxonomy term
      [boulch]

- imio.smartweb.common 1.2.24

    - WEB-4232 : Refactoring of the code that prevents the deletion of a taxonomy term if it is used in at least one object
      [boulch]

- imio.smartweb.common 1.2.23

    - WEB-3718 : Accessibility : Add aria-label for consent buttons
      [boulch]

- WEB-4226 : Use waitress instead of gunicorn
  The issue leading to a high load with waitress has been fixed in waitress 3.0.1
  See https://github.com/Pylons/waitress/pull/435
  [remdub]

- imio.events.core 1.2.29

    - Cache the UserAgendas vocabulary and set pattern_options to start the AJAX query after 3 characters
      [boulch]

    - Update Python classifiers to be compatible with Python 3.12
      [remdub]

    - Migrate to Plone 6.0.14
      [boulch]


1.4.8 (2025-02-24)
------------------

- imio.smartweb.common 1.2.22

    - WEB-4153 : Ruleset plone.stableResource for image scales
      [remdub]

1.4.7 (2025-02-02)
------------------

- Set event log level to error in production configuration and debug in dev configuration
  [bsuttor]

- imio.smartweb.common 1.2.21

    - Fix: Updated to align scale behavior with the fix in plone.scale ([commit a352815](https://github.com/plone/plone.scale/commit/a352815#diff-24f46fc714c6d36041bcea7e64a7d5aeceacd929eb802655276a1d8f4b4576f4R209))
      [boulch]


1.4.6 (2025-01-29)
------------------

- Migrate to Python 3.12, Plone 6.0.14
  [boulch, remdub]

- z3c.jbot 2.1

    - Fix error when Plone site is not yet set as in first index_html call on Zope
      [bsuttor]


1.4.5 (2025-01-20)
------------------

- imio.events.policy 1.1.5

    - WEB-4153 : Increase caching values
      [remdub]


1.4.4 (2025-01-09)
------------------

- imio.events.core 1.2.28

  - WEB-4153 : Add a new cacheRuleset to use with our custom rest endpoints
    [remdub]

- imio.events.policy 1.1.4

  - WEB-4153: Set moderateCaching for imio.events.core.rest
    [remdub]


1.4.3 (2024-10-14)
------------------

- Sync gunicorn version with Plone 6.0.9
  [remdub]


1.4.2 (2024-08-05)
------------------

- imio.events.core 1.2.27

  - WEB-4130 : Fix bug which forbid to remove events
    [boulch]


1.4.1 (2024-07-31)
------------------

- WEB-3995 : Bump RelStorage to 4.0.0
  [remdub]

- WEB-3995 : Bump psycopg2 to 2.9.9
  [remdub]

- Upgrade to Zope 5.9
  [remdub]


1.4 (2024-07-02)
----------------

- Upgrade docker image to Ubuntu 22.04
  [remdub]


1.3.13 (2024-07-01)
-------------------

- imio.events.core 1.2.26

    - WEB-4121 : Add logs if container_uid is None
      [boulch]


1.3.12-quick (2024-06-21)
-------------------------

- imio.events.core 1.2.25

    - WEB-4088 : Use transaction commit hook to be sure event object is available before odwb call
      [boulch]

    - GHA tests on Python 3.8 3.9 and 3.10
      [remdub]


1.3.11-quick (2024-06-21)
-------------------------

- imio.events.core 1.2.24

    - WEB-4088 : Use one state workflow for imio.events.Agenda / imio.events.Folder
      [boulch]

- imio.smartweb.locales 1.1.19

    - Add missing fr/de/nl translations for imio.events.core
      [boulch]

    - Update translations
      [boulch]

- imio.events.core 1.2.23

    - Add events lead image (preview scale) for odwb and some logs
      [boulch]

    - Refactor items_to_delete : Added translations / Corrected result of number of items
      [boulch]


1.3.10 (2024-06-10)
-------------------

- imio.smartweb.common 1.2.17

    - WEB-4113 : Add `TranslatedAjaxSelectFieldWidget` to fix translations of initial
      values in select2 fields
      [laulaz]

- imio.smartweb.common 1.2.16

    - WEB-4107 : Update resource registries modification time (used as ETag) at Zope startup
      [laulaz]

- imio.events.core 1.2.22

    - WEB-4113 : Use `TranslatedAjaxSelectWidget` to fix select2 values translation
      [laulaz]


1.3.9 (2024-05-30)
------------------

- imio.events.core 1.2.21

    - WEB-4101 : Calculate `search-filters` JSON based on `@events` search results logic.
      We need to refactor & test (more) this module.
      [laulaz]

- imio.events.core 1.2.20

    - WEB-4101 : Add index for local category search
      [laulaz]

- imio.smartweb.common 1.2.15

    - Fix missing ZCML dependency
      [laulaz]

- imio.smartweb.common 1.2.14

    - Fix bundles: Remove obsolete patterns bundle and fix a previous upgrade for
      eea.facetednavigation
      [laulaz]

    - Fix translate call (was causing incorrect string in .po file)
      [laulaz]

    - Fix translation message string
      [laulaz]

- imio.events.core 1.2.19

    - Fix naming of two fields for odwb
      [boulch]

- imio.events.core 1.2.18

    - improves odwb fields nomenclature
      [boulch]

- imio.smartweb.locales 1.1.18

    - Add missing FR translations
      [laulaz]

- imio.smartweb.locales 1.1.17

    - Add missing fr/de/nl translations for Skip to content/navigation/footer
      [boulch]

    - Update translations
      [boulch]

- imio.events.core 1.2.17

    - WEB-4101 : Handle (local) categories translations with datagrid field and new indexes. French value is used as identifier for local categories.
      [laulaz]

    - WEB-4088 : Cover use case for sending data in odwb for a staging environment
      [boulch]

    - Fix Topics & Categories in SearchableText translated indexes
      [laulaz]

    - WEB-4088 : Add some odwb endpoints (for events , for entities)
      [boulch]

    - WEB-4108 : Prevent removing calendar if there is at least 1 event in it.
      [boulch]

- imio.smartweb.common 1.2.13

    - WEB-4088 : Cover use case for sending data in odwb for a staging environment
      [boulch]

    - Ensure translation of vocabularies when used with AjaxSelectFieldWidget
      [laulaz]

    - Remove useless container_uid from search-filters results
      [laulaz]

    - WEB-3864 : Ensure that a taxonomy term that is deleted is not used anywhere
      [boulch]

    - WEB-3862 : Unpatch (restore original) eea.facetednavigation jquery
      [laulaz]

- imio.smartweb.common 1.2.12

    - WEB-4102 : Add second skip to footer
      [thomlamb]

- imio.smartweb.common 1.2.11

    - WEB-4101 : Fix vocabulary terms translation (for Topics only - for the moment)
      when used with `AjaxSelectFieldWidget`
      [laulaz]

- imio.smartweb.common 1.2.10

    - WEB-4101 : Change Topics field widget to keep value ordering
      [laulaz]

    - WEB-4088 : Implement some odwb utils and generic classes
      [boulch]

- imio.events.core 1.2.16

    - WEB-4101 : Use local category (if any) instead of category in `category_title` indexer
      [laulaz]


1.3.8 (2024-04-10)
------------------

- Update versions of setuptools, wheel, pip, Plone in Dockerfile
  [boulch]

- imio.events.core 1.2.15

    - Fix : Keep events where start date is earlier than current date and end date is later than current date (when no period defined)
      [boulch]

- Migrate to Plone 6.0.9
  [boulch]


1.3.7 (2024-04-04)
------------------

- imio.events.core 1.2.14

    - Fix serializer. Sometimes we have brain, sometines event, agenda or folder...
      [boulch]


1.3.6 (2024-04-04)
------------------

- imio.events.core 1.2.13

    - Getting agenda title/id to use it in rest views
      [boulch]

- imio.events.core 1.2.12

    - MWEBPM-9 : Add container_uid as metadata_field to retrieve agenda id/title in event serializer and set it in our json dataset
      [boulch]

    - MWEBPM-8 : Add support for getting only past events
      [boulch]


1.3.5 (2024-03-25)
------------------

- imio.smartweb.locales 1.1.13

    - Add missing fr, nl, de translations
      [boulch]

    - Update translations
      [boulch]

- imio.events.core 1.2.11

    - Fix some issues (bad copy/paste!)
      [boulch] 

- imio.events.core 1.2.10

    - WEB-4068 : Refactor / Fix some issues
      [boulch] 

- imio.events.core 1.2.9

    - WEB-4068 : Add field to limit the new feature "adding events in any agenda" to some entities
      [boulch]

- imio.events.core 1.2.8

    - WEB-4068 : Refactor "adding events in any agenda" : (update translations, add feature : "remove agenda")
      [boulch]

- imio.events.core 1.2.7

    - WEB-4068 : Adding events in any agenda of the current entity
      [boulch]


1.3.4 (2024-03-05)
------------------

- imio.events.core 1.2.6

    - WEB-4072, WEB-4073 : Enable solr.fields behavior on some content types
      [remdub]

    - WEB-4006 : Exclude some content types from search results
      [remdub]

    - MWEBRCHA-13 : Add versioning on imio.events.Event
      [boulch]

- collective.solr 9.3.0

    - Add support of https connections
      [remdub]

    - Add french locales
      [remdub]

- collective.solr 9.2.3

    - Add upgrade step for missing stopwords registry entries
      [remdub]

1.3.3 (2024-02-12)
------------------

- imio.smartweb.common 1.2.9

    - WEB-4064 : Reindex SolR because of changes in schema
      [remdub]

- imio.smartweb.common 1.2.8

    - Fix skip content sr-only
      [thomlamb]

- imio.smartweb.common 1.2.7

    - WEB-4046 : Add css for "Skip to content"
      [thomlamb]

    - WEB-4046 : Add "Skip to content" link for a11y
      [laulaz]

    - WEB-4048 : Put focus on cookies accept button for a11y
      [laulaz]


1.3.2 (2024-01-29)
------------------

- imio.events.core 1.2.5

    - WEB-3802 : Fix : Avoid noizy events occurrences. Occurences that begin later than min date with a valid end date.
      [boulch]

- imio.events.core 1.2.4

    - WEB-3802 : Fix : Keep events occurrences when start date is smaller than min date but end date is greater than min date
      [boulch]

- imio.events.core 1.2.3

    - WEB-3802 : Manually filter dates to respect range passing into REST request.
      [boulch]

- imio.events.core 1.2.2

    - WEB-3802 : Get dates range for events in REST views. Comming from imio.smartweb.core React view
      [boulch]

- imio.events.core 1.2.1

    - WEB-4041 : Handle new "carre" scale
      [boulch]

- imio.smartweb.common 1.2.6

    - WEB-4041 : Add new "carre" scale
      [boulch]

- imio.smartweb.common 1.2.5

    - WEB-4007 : Get ContactProperties out of imio.smartweb.core to also use it in imio.directory.core and simplifying formated schedule displaying in REACT directory view
      [boulch]

    - WEB-4029 : File and Image content types don't have WF so we set effective date equal to created date
      [boulch]

- imio.smartweb.common 1.2.4
    - WEB-3783 : Rebuild url with request.form datas (usefull with react views)
      [boulch]


1.3.1-quick (2023-11-23)
------------------------

- Release to force new docker tag / deploy after incomplete build
  [laulaz]


1.3 (2023-11-22)
----------------

- imio.smartweb.common 1.2.3

    - Improve image compression quality
      [laulaz]
  
    - Change portrait scales dimensions
      [laulaz]

- imio.smartweb.common 1.2.2

    - Fix missing values for facilities lists (causing None in REST views filters) See collective/collective.solr#366
      [laulaz]

    - Fix last upgrade steps: when run from command line, we need to adopt admin user to find private objects
      [laulaz]

    - WEB-4003 : Fix missing TextField mimetypes
      [laulaz]

- imio.smartweb.common 1.2.1

    - SUP-33128 : Fix eea.facetednavigation : Hide items with 0 results
      [boulch, laz]

    - Refactor less and js compilation + Add compilations files
      [boulch]

- imio.smartweb.locales 1.1.9

    - WEB-4018 : Add missing French translations (new termes in directory vocabulary)
      [boulch]
  
- imio.smartweb.locales 1.1.8

    - Add missing French translations
      [laulaz]

- imio.smartweb.locales 1.1.7

    - Add missing French translations
      [boulch]

    - Update translations
      [boulch]

- imio.smartweb.locales 1.1.6

    - Add missing French translations (external content section and contact section)
      [boulch]

- Develop collective.solr to implement https connection DEVOPS-3
  [remdub]

- imio.events.core 1.2

    - WEB-3985 : Use new portrait / paysage scales & logic
      [boulch, laulaz]

    - WEB-3985 : Remove old cropping information when image changes
      [boulch, laulaz]

- imio.smartweb.common 1.2

    - WEB-3985 : New portrait / paysage scales & logic.
      We have re-defined the scales & sizes used in smartweb.
      We let the user crop only 2 big portrait / paysage scales and make the calculation behind the scenes for all
      other smaller scales.
      We also fixed the cropping information clearing on images changes.
      [boulch, laulaz]


1.2.16 (2023-10-18)
-------------------

- imio.events.core 1.1.15

    - WEB-3997 : Fix : Initial agenda must be kept!
      [boulch]

    - WEB-3997 : Fix : Add condition to avoid getting a broken "_broken_to_path" old/removed agenda
      [boulch]


1.2.15 (2023-10-17)
-------------------

- imio.events.core 1.1.14

    - WEB-3997 : Fix recursive_generator if agenda A has a reference to agenda B and agenda B has a reference to agenda A
      [boulch]


1.2.14 (2023-10-11)
-------------------

- imio.events.core 1.1.13

    - WEB-3997 : Add cascading agendas subscriptions retrieval in endpoint to get events "by dependency"
      [boulch]


1.2.13 (2023-10-09)
-------------------

- imio.events.core 1.1.12

    - WEB-3989 : Fix infinite loop on object deletion & remove logs
      [laulaz]

- imio.events.core 1.1.11

    - Avoid infinite loop with bad recurrence RRULE expression (INTERVAL=0") - improved See plone/plone.formwidget.recurrence#39
      [laulaz]

- imio.events.policy 1.1.3

    - WEB-3954 : Hide cropping action on Image type
      [boulch]

    - Migrate to Plone 6.0.4
      [boulch]

- imio.smartweb.locales 1.1.5

    - Add missing translations
      [boulch]

- imio.smartweb.locales 1.1.4

    - Add missing French translation (folder_contents properties)
      [laulaz]

    - Migrate to Plone 6.0.4
      [boulch]

- imio.smartweb.common 1.1.9

    - WEB-3974 : Add new registry key (imio.smartweb.common.log) to activate logging in smartweb / auth sources products
      [boulch]

    - Fix AttributeError in case of instance behaviors attributes that are not on all objects
      [boulch]


1.2.12 (2023-09-13)
-------------------

- imio.events.core 1.1.11

    - Avoid infinite loop with bad recurrence RRULE expression (`INTERVAL=0"`) - improved
      See https://github.com/plone/plone.formwidget.recurrence/issues/39
      [laulaz]

- imio.smartweb.common 1.1.8

    - WEB-3960 : Clean unhautorized xml chars out of text when added or modified contents Temporary patch.
      Waiting for this fix : plone/plone.app.z3cform#167
      [boulch]

    - WEB-3955 : Authentic sources : Crop view on Image type should not return scales
      [boulch]
  
- imio.smartweb.common 1.1.7

    - Change banner scale to have infinite height
      [laulaz]

    - Migrate to Plone 6.0.4
      [boulch]


1.2.11-quick (2023-07-26)
-------------------------

- imio.events.core 1.1.10

    - [WEB-3937] Fix add / edit forms for events
      [boulch, laulaz]


1.2.10 (2023-07-25)
-------------------

- imio.events.core 1.1.9

    - [WEB-3937] Limit event duration to maximum 3 years
      [boulch, laulaz]


1.2.9-quick (2023-07-18)
------------------------

- imio.events.core 1.1.8

    - Add logs in endpoint. Help us to find why agenda go slowlier
      [boulch]


1.2.8 (2023-07-03)
------------------

- imio.events.core 1.1.7

    - Avoid infinite loop with bad recurrence RRULE expression (`INTERVAL=0"`)
      See https://github.com/plone/plone.formwidget.recurrence/issues/39
      [laulaz]

- WEB-3781 : Add autopublish script
  [remdub]


1.2.7-quick (2023-05-10)
------------------------

- Rollback to Zope 5.8 for now because of a bug in POST requests with gunicorn
  [laulaz]


1.2.6-quick (2023-05-05)
------------------------

- imio.events.core 1.1.6

    - INFRA-4725 : Add logging to find infinite loop in recurrence calculation
      [laulaz]
    
    - Migrate to Plone 6.0.4
      [boulch]

- Migrate to Plone 6.0.4
  [boulch]


1.2.5 (2023-04-25)
------------------

- imio.smartweb.common 1.1.6

    - Don't use image_scales metadata anymore (Fix faceted)
      [boulch, laulaz]

    - Update object modification date if cropping was removed/updated
      [boulch, laulaz]

- imio.events.policy 1.1.2

    - Add module : collective.messagesviewlet
      [boulch]

    - Migrate to Plone 6.0.2
      [boulch]


1.2.4 (2023-04-02)
------------------

- imio.events.core 1.1.5

    - Need fullobjects in query to avoid "Cannot read properties of undefined (reading 'latitude')" in rest view
      So, we need to serialize first_start and first_end from obj.start and obj.end. If we don't do that, we got brain.start/end
      these are updates with first valid event occurence
      [boulch]

- imio.events.core 1.1.4

    - Fix occurrences expansion calculation for start dates
      We can't use start/end recurring indexes because they return the next occurrence
      and not the first one, so recurrence rule cannot be applied on them.
      [laulaz]
    
    - Fix bug calculating event_dates index with occurrences
      [laulaz]

    - WEB-3908 : Create new endpoint to serve batched events occurrences
      [boulch]


1.2.3-quick (2023-03-20)
------------------------

- Push images to prod registry.
  [bsuttor]


1.2.2 (2023-03-19)
------------------

- imio.smartweb.common 1.15

    - WEB-3862 : Patch (Remove select2) eea.facetednavigation jquery
      [laulaz, boulch]

- Get collective.solr = 9.1.1 from buildout.smartweb/versions.cfg
  [boulch]

- imio.smartweb.locales 1.1.3

    - Add missing French translations (Cirkwi & image dimensions warning)
      [laulaz]

    - Migrate to Plone 6.0.2
      [boulch]

- imio.events.core 1.1.3

    - Add warning message if images are too small to be cropped
      [laulaz]

    - Migrate to Plone 6.0.2
      [boulch]

    - Fix reindex after cut / copy / paste in some cases
      [laulaz]

- imio.smartweb.common 1.1.4

    - Allow to add portal messages when content images are too small for cropping. This can be done dynamically on a view call with a single line of code: show_warning_for_scales(self.context, self.request)
      [laulaz]

    - Migrate to Plone 6.0.2
      [boulch]


1.2.1-quick (2023-03-08)
------------------------

- Develop collective.solr to fix an issue with image_scales metadata
  [mpeeters]


1.2.0 (2023-03-07)
------------------

- Migrate to Plone 6.0.2
  [boulch]

- imio.smartweb.locales 1.1.2

    - WEB-3848 : Add missing translations
      [boulch]

- imio.smartweb.common 1.1.3

    - WEB-3852 : Fix atom/syndication registry keys
      [boulch]


1.2 (2023-02-20)
----------------

- imio.events.core 1.1.2

    - Remove unused title_fr and description_fr metadatas
      [laulaz]

    - Remove SearchableText_fr (Solr will use SearchableText for FR)
      [laulaz]

- plone.formwidget.geolocation > fix-geosearch

    - Fix usage of default location from configuration
      [mpeeters]

    - Ensure that the marker is the main marker to fix geosearch
      [mpeeters]

- imio.smartweb.common 1.1.2

    - Call @@consent-json view on navigation root (instead of context)
      [laulaz]

    - Ensure Ajax requests are always uncached
      [laulaz]

- Update to Plone 6.0.0.2
  [laulaz]

- imio.smartweb.locales 1.1

    - Add DE translations (with copied French sentences for now)
      [laulaz]

    - Update buildout to Plone 6.0.0 final
      [laulaz]

- imio.events.core 1.1.1

    - Add new descriptions metadatas and SearchableText indexes for multilingual
      [laulaz]

- imio.events.policy 1.1.1

    - Install and configure autopublishing (with 15 min tick subscriber)
      [boulch]

    - Remove obsolete TinyMCE override
      [laulaz]

    - Remove available languages (we don't need them anymore)
      [laulaz]

- imio.smartweb.common 1.1.1

    - Allow to choose language for vocabulary term translation
      [laulaz]

    - Use bootstrap dropdown-toggle for fieldsets collapse icon on edit forms
      [laulaz]

    - Fix TinyMCE menu bar and format menu
      [laulaz]

    - Update widget.pt override from plone.app.z3cform.templates
      [laulaz]

    - Improve monkeypatch to fix TTW resource calling
      [laulaz]

    - Update buildout to get Plone 6.0.0 final
      [laulaz]

- imio.smartweb.common 1.1

    - Add monkeypatch to fix TTW resource calling See plone/Products.CMFPlone#3705
      [laulaz]

    - Uninstall collective.js.jqueryui
      [boulch]

    - Remove faceted deprecated bundles
      [boulch]

    - Migrate to Plone 6 : remove dexteritytextindexer, use new simplified resources registry, fix TinyMCE configuration and images scales, manual minimized js
      [laulaz, boulch]

- imio.events.policy 1.1

    - Update to Plone 6.0.0 final
      [boulch]

- imio.events.core 1.1

    - Update to Plone 6.0.0 final
      [boulch]


1.1 (2022-11-24)
----------------

- imio.events.core 1.0.1

    - Fix SearchableText index for multilingual
      [laulaz]

- imio.events.core 1.0

    - Add multilingual features: New fields, vocabularies translations, restapi serializer
      [laulaz]

- imio.events.policy 1.0

    - Add available languages to prepare for multilingual
      [laulaz]

    - Update buildout to use Plone 6.0.0a3 packages versions
      [boulch]

- imio.smartweb.locales 1.0.8

    - Add missing French translations (Sendinblue, multilingual)
      [laulaz]

- imio.smartweb.locales 1.0.7

    - Add some directory fields translations
      [boulch]

    - Exclude profiles.zcml from translations
      [laulaz]

- imio.smartweb.common 1.0.10

    - Ignore batch related query parameters for search-filters endpoint
      [laulaz]

- imio.smartweb.common 1.0.9

    - Add helper method to get language from smartweb REST requests This is needed for multilingual authentic sources
      [laulaz]

    - Allow to translate vocabulary terms titles in search-filters endpoint This is needed for multilingual authentic sources
      [laulaz]

- imio.smartweb.common 1.0.8

    - MWEB-54 : Update TinyMCE : Add non breaking space option
      [boulch]


1.0.9 (2022-10-23)
------------------

- imio.events.core 1.0a6

    - WEB-3770 : Add serializer to get included items when you request an imio.events.Event fullbobjects
      [boulch]

    - WEB-3757 : Automaticaly create some defaults agendas (with agendas subscription) when creating a new entity
      [boulch]

    - WEB-3726 : Add subjects (keyword) in SearchableText
      [boulch]


1.0.8 (2022-10-18)
------------------

- imio.events.core 1.0a5

    - Add logging to find cause of infinite loop statement
      [laulaz]

    - Add eea.faceted.navigable behavior on Entity & Agenda types
      [laulaz]


1.0.7 (2022-09-06)
------------------

- Blobs are now on filesystem.
  [bsuttor]


1.0.6-quick (2022-07-18)
------------------------

- Update pas.plugins.imio 2.0.6.
  [bsuttor]


1.0.5-quick (2022-07-14)
------------------------

- imio.events.core 1.0a4

    - Ensure objects are marked as modified after appending to a list attribute
      [laulaz]

    - Fix selected_agendas on events after creating a "linked" agenda
      [boulch]

- imio.smartweb.common 1.0.7

    - Add connection link in colophon
      [laulaz]

- imio.smartweb.common 1.0.6

    - Add ban_physicalpath method (taken from policy)
      [boulch, laulaz]

- imio.smartweb.common 1.0.5

    - Refactor rich description to retrieve html on a any description
      (from context or from other ways)
      [boulch]

- imio.smartweb.locales 1.0.6

    - Add Dutch translations files
      [laulaz]

    - Add faceted map translation
      [laulaz]

    - Add propose URLs translations
      [laulaz]

- imio.smartweb.locales 1.0.5

    - Add translation for Agent connection
      [laulaz]

- imio.smartweb.locales 1.0.4

    - Add translations for contact gallery
      [laulaz]

    - Add translations for post-it section
      [laulaz]


1.0.4 (2022-07-13)
------------------

- Update pas.plugins.imio 2.0.5, see https://github.com/IMIO/pas.plugins.imio/blob/2.0.5/CHANGES.rst
  [bsuttor]


1.0.3 (2022-05-03)
------------------

- imio.smartweb.locales 1.0.3

    - Add translation for image upload
      [laulaz]

    - Add translations for new icons
      [laulaz]

- imio.smartweb.locales 1.0.2

    - Add Hero banner related translations
      [laulaz]

- imio.smartweb.locales 1.0.1

    - Add missing translation for Local Manager & lead image portrait mode
      [laulaz]

- imio.smartweb.locales 1.0

    - Change 'minisite' to 'site partenaire' in French
      [laulaz]

    - Add icon field related translations
      [laulaz]

- imio.smartweb.locales 1.0a16

    - Fix translation
      [laulaz]

- imio.smartweb.locales 1.0a15

    - Add new icons translations (e-guichet & shopping)
      [laulaz]

- imio.smartweb.locales 1.0a14

    - Add social network translation
      [laulaz]

- imio.smartweb.locales 1.0a13

    - Add event dates related translations
      [laulaz]

- imio.smartweb.locales 1.0a12

    - Add e_guichet view and taxonomies instance behaviors translations
      [laulaz]

- imio.events.core 1.0a3

    - Remove useless imio.events.Page content type
      [boulch]

    - Use unique urls for images scales to ease caching
      [boulch]

    - Use common.interfaces.ILocalManagerAware to mark a locally manageable content
      [boulch]

- imio.smartweb.common 1.0.4

    - Limit uploaded files sizes to 20Mo with JS (without reaching the server)
      [laulaz]

    - Add help text on lead image field also on edit forms
      [laulaz]

- imio.smartweb.common 1.0.3

    - Hide faceted actions
      [boulch]

- imio.smartweb.common 1.0.2

    - Hide unwanted upgrades from site-creation and quickinstaller
      [boulch]

    - Add local manager role and sharing permissions rolemap
      [boulch]

    - Add help text on lead image fields
      [boulch]

    - Fix privacy views JS calls (sometimes called on Zope root instead of Plone root)
      [laulaz]

    - Add Subject keywords to SearchableText index
      [laulaz]

- Use released version for collective.z3cform.select2
  [laulaz]


1.0.2 (2022-03-29)
------------------

- Remove gunicorn timeout to allow long requests
  [laulaz]

- Switch collective.solr from auto-checkout to 9.0.0a6 pinned buildout.smartweb version
  [boulch]


1.0.1-quick (2022-03-17)
------------------------

- imio.smartweb.common 1.0.1

    - Allow readers, editors and reviewers to see inactive (expired) contents
      [laulaz]

- imio.smartweb.common 1.0.

    - Avoid traceback if @@get_analytics is called outside Plone site
      [laulaz]

- imio.smartweb.common 1.0a11

    - Load Analytics via JS call to avoid non-privacy aware caching
      [laulaz]

    - Change privacy views permissions to zope.Public
      [laulaz]

- imio.smartweb.common 1.0a10

    - Hide ical import related actions
      [laulaz]

- imio.smartweb.common 1.0a9

    - Update buildout to use Plone 6.0.0a3 packages versions
      [boulch]

    - Remove unneeded override: it has been included in plone.app.z3c.form
      See https://github.com/plone/plone.app.z3cform/issues/138
      [laulaz]

- Use https:// instead of git:// protocol
  See https://github.blog/2021-09-01-improving-git-protocol-security-github/
  [laulaz]


1.0 (2022-03-01)
----------------

- Use Gunicorn instead of Waitress.
  [bsuttor]

- Add py-spy for debugging.
  [bsuttor]


1.0a2 (2022-02-09)
------------------

- imio.events.core 1.0a2

    - Add event_dates index to handle current events queries correctly
      [laulaz]

    - Update buildout to use Plone 6.0.0a3 packages versions
      [boulch]

- Update buildout to use Plone 6.0.0a3 packages versions
  [boulch]


1.0a1 (2022-01-26)
------------------

- Initial release
  [boulch]
