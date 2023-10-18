1.2.17 (unreleased)
-------------------

- Nothing changed yet.


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
