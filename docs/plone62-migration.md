# Migrating Events to Plone 6.2.3

Tracks the move of Events (branch `plone62`, WEB-4533) to Plone 6.2.3 and
Python 3.14. Most of the work is shared with SmartWeb: this buildout extends
the `plone62` pins and sources of buildout.smartweb, and the packages leave
old-style namespace packages (PEP 420) the way the
[SmartWeb migration guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md)
describes. This page covers only what is specific to Events: the packages it
checks out, what changed in this repository, and what's left before `plone62`
can be merged into `main`.

Last updated: 2026-11-23.

## Status

**17 packages**: **8 done** (released, pinned, no longer checked out) · **1
released and pinned**, still checked out by `dev.cfg` on purpose
(imio.smartweb.common) · **1 released**, not pinned yet (imio.events.core) ·
**3 merged**, not released · **4 branches pushed**, no PR yet

✅ done · ⬜ to do · ➖ not applicable · 🚧 its pinned release calls
`pkg_resources` and fails on Plone 6.2.3

| Package | Checked out by | Branch | PR | Merged | Released | Pinned |
|---|:-:|:-:|:-:|:-:|:-:|:-:|
| [imio.events.core](#imioeventscore-and-imioeventspolicy) | dev, prod | `plone62` (deleted) | [#18](https://github.com/IMIO/imio.events.core/pull/18) | ✅ | 2.0.0 | ⬜ |
| [imio.events.policy](#imioeventscore-and-imioeventspolicy) | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.omnia.core](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imioomniacore) | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.omnia.tinymce](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imioomniatinymce) | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.helpers](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiohelpers) 🚧 | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.pyutils](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiopyutils) | dev, prod | `master` | [#4](https://github.com/IMIO/imio.pyutils/pull/4) | ✅ | ⬜ | ⬜ |
| [collective.autopublishing](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveautopublishing) | dev, prod | `master` | [#12](https://github.com/collective/collective.autopublishing/pull/12) | ✅ | ⬜ | ⬜ |
| [collective.upgrade](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveupgrade) | dev, prod | `master` | [#20](https://github.com/collective/collective.upgrade/pull/20) | ✅ | ⬜ | ➖ |
| [collective.behavior.talcondition](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivebehaviortalcondition) | ➖ | ➖ | [#17](https://github.com/collective/collective.behavior.talcondition/pull/17) | ✅ | 2.0.0 | ✅ |
| [collective.fingerpointing](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivefingerpointing) | ➖ | ➖ | [#110](https://github.com/collective/collective.fingerpointing/pull/110) | ✅ | 2.0.0 | ✅ |
| [collective.messagesviewlet](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivemessagesviewlet) | ➖ | ➖ | [#24](https://github.com/collective/collective.messagesviewlet/pull/24) | ✅ | 2.0.0 | ✅ |
| [collective.privacy](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveprivacy) | ➖ | ➖ | [#22](https://github.com/collective/collective.privacy/pull/22) | ✅ | 2.0.0 | ✅ |
| [collective.timedevents](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivetimedevents) | ➖ | ➖ | [#13](https://github.com/collective/collective.timedevents/pull/13) | ✅ | 2.0.0 | ✅ |
| [imio.gdpr](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiogdpr) | ➖ | ➖ | [#5](https://github.com/IMIO/imio.gdpr/pull/5) | ✅ | 2.0.0 | ✅ |
| [imio.smartweb.locales](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiosmartwebcommon-core-locales-policy) | ➖ | ➖ | [#4](https://github.com/IMIO/imio.smartweb.locales/pull/4) | ✅ | 2.0.0 | ✅ |
| [pas.plugins.kimug](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#paspluginskimug) | ➖ | ➖ | [#34](https://github.com/IMIO/pas.plugins.kimug/pull/34) | ✅ | 2.0.0 | ✅ |
| [imio.smartweb.common](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiosmartwebcommon-core-locales-policy) | dev | `main` | [#37](https://github.com/IMIO/imio.smartweb.common/pull/37) | ✅ | 2.0.0 | ✅ |

Columns:

- **Checked out by**: the `auto-checkout` of `dev.cfg` (dev) and `prod.cfg`
  (prod, so the Docker image). A package checked out by prod only runs as a
  release on a dev instance, and one checked out by dev only runs as its
  pinned release in the image. ➖: no longer checked out, the pinned release
  is used.
- **Branch**: the branch mr.developer checks out. It comes from this
  repository's `sources.cfg` for the four `imio.events.*` and `imio.omnia.*`
  packages, and from buildout.smartweb's `sources.cfg` for the others.
- **PR**: the pull request that merges the native branch. ⬜: none opened yet.
- **Released**: the native version on PyPI. **Pinned**: a `versions.cfg`
  (this one or buildout.smartweb's) pins it. ➖: collective.upgrade is never
  pinned, every config checks it out.

Each row links to the package's details in the SmartWeb guide, except the two
Events packages, [described below](#imioeventscore-and-imioeventspolicy).

## What's left

### Open pull requests

- [x] imio.events.core: merged into `main`
  ([#18](https://github.com/IMIO/imio.events.core/pull/18)) and released as
  2.0.0 (2026-11-23).
- [ ] imio.events.policy: `plone62` into `main`.
- [ ] imio.events.policy's `base.cfg` checks out imio.events.core in a
  `[sources]` section of its own, because "buildout.events has no plone62
  branch yet". That checkout points at imio.events.core's `plone62` branch,
  deleted once [#18](https://github.com/IMIO/imio.events.core/pull/18) was
  merged: drop it and use the 2.0.0 release.
- [ ] imio.events.core's and imio.events.policy's `base.cfg` still check out
  imio.smartweb.common, imio.smartweb.locales,
  collective.behavior.talcondition and collective.privacy (and
  collective.timedevents for the policy). buildout.smartweb pins their
  native 2.0.0 now: drop them from `auto-checkout`. Only imio.helpers still
  needs its branch.

The PRs of the shared packages are tracked in the
[SmartWeb guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#open-pull-requests).

### Clean up the checkouts

- [x] collective.messagesviewlet: dropped from `prod.cfg` (2026-11-19).
  `prod.cfg` checked it out from `plone62`, the branch buildout.smartweb's
  `sources.cfg` names, which was deleted once
  [#24](https://github.com/collective/collective.messagesviewlet/pull/24) was
  merged. mr.developer couldn't clone it, so the image no longer built. The
  image now installs the native 2.0.0 that buildout.smartweb pins.
- [x] imio.smartweb.locales: dropped from `auto-checkout`, and
  `imio.smartweb.locales = 1.1.51` removed from `versions.cfg`, in the same
  commit (2026-11-19). `versions.cfg` is extended last, so its 1.1.51
  (old-style) overrode the 2.0.0 that buildout.smartweb pins: the checkout
  only hid it.
- [x] collective.timedevents and imio.gdpr: dropped from `auto-checkout`
  (2026-11-19). buildout.smartweb pins their native 2.0.0.
- [x] imio.smartweb.common: dropped from `prod.cfg` and from this
  repository's `sources.cfg` (2026-11-19). Its `plone62` branch was deleted
  once [#37](https://github.com/IMIO/imio.smartweb.common/pull/37) was
  merged. `versions.cfg` pins 2.0.0 in place of 1.2.65, so the image
  installs the release. `dev.cfg` still checks it out, from `main` now (the
  branch buildout.smartweb's `sources.cfg` names), as on this repository's
  `main`.
- [x] collective.behavior.talcondition, collective.fingerpointing and
  collective.privacy: dropped from `dev.cfg` and `prod.cfg` (2026-11-20).
  buildout.smartweb pins their native 2.0.0. collective.fingerpointing could
  not stay: buildout.smartweb's `sources.cfg` no longer names it (since
  2026-11-19), and mr.developer stops on an `auto-checkout` package without
  a source, so the next image build would have failed.
- [x] collective.upgrade: its `plone61` line dropped from `sources.cfg`
  (2026-11-20). [#20](https://github.com/collective/collective.upgrade/pull/20)
  merged that work into `master`, the branch buildout.smartweb's
  `sources.cfg` names (`plone61` has no commit that `master` lacks).
- [x] pas.plugins.kimug: dropped from `dev.cfg`, and its line from
  `sources.cfg` (2026-11-20). buildout.smartweb pins 2.0.0.
- [ ] imio.events.core: its `plone62` branch was deleted once
  [#18](https://github.com/IMIO/imio.events.core/pull/18) was merged, and
  `sources.cfg` still names it, so mr.developer can't clone it and the next
  image build fails. Drop it from `prod.cfg`, pin 2.0.0 in `versions.cfg` in
  place of 1.2.60, and check out `main` in `dev.cfg` (as for
  imio.smartweb.common).
- [x] `dev.cfg` and `prod.cfg` check out the same packages (2026-11-20):
  `dev.cfg` now checks out collective.autopublishing too, as
  buildout.smartweb does, so a dev instance runs the code of the image. Only
  imio.smartweb.common is checked out by dev only, on purpose.

### Release

When the Plone 6.2 stack goes to production. A PyPI release can't depend on a
git branch, so the order matters:

- [ ] The shared packages first, in the order of the
  [SmartWeb guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#release).
  imio.smartweb.common is done: 2.0.0 is released and pinned in
  `versions.cfg`. So are collective.behavior.talcondition,
  collective.fingerpointing and collective.privacy: buildout.smartweb pins
  their 2.0.0.
- [x] imio.events.core: released as 2.0.0 (2026-11-23). It drops Plone 6.1.
- [ ] imio.events.policy (it requires imio.events.core): release it as
  2.0.0, as the SmartWeb guide does for the other packages. Its
  `CHANGES.rst` still says 1.1.10.
- [ ] Pin each native release in `versions.cfg`, replacing the old-style
  pins (imio.events.core 1.2.60, imio.events.policy 1.1.9). Then drop the
  checkout and the `sources.cfg` line.

### Check by hand on an Events site

- [ ] Search, and the indexing of a new event: collective.solr goes from
  9.4.0 to 11.0.0.dev0
  ([details](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivesolr)).
  Check the `events` core of the production Solr too.
- [ ] The faceted agenda views and their map: change a filter and check that
  the markers follow the results
  ([details](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/plone-formwidget-geolocation.md)).
- [ ] The event add and edit forms: geolocation, taxonomy (`event_public`),
  select2 widgets, recurrence.
- [ ] `make upgrade-steps` on a copy of the production database: no step left
  pending.
- [ ] Health probes on port 8081 (`/live`, `/ready`, `/startup`) and
  `@@metrics`.

### When `plone62` is merged into `main`

- [ ] `base.cfg`: extend buildout.smartweb's `main` again (once its own
  `plone62` is merged).
- [ ] `sources.cfg`: back to `main`/`master`, or the lines dropped once the
  packages are released.
- [ ] `tests/docker-compose.test.yml`: fetch the Solr configuration from
  buildout.smartweb's `main`.
- [ ] Delete `.github/workflows/plone62.yml` and its section in
  `.github/workflows/README.md`.
- [ ] `dev.yml` and `staging.yml`: test the image before tagging it, as
  `plone62.yml` does, so a failing image never gets the `:dev` or `:staging`
  tag.

## What changed in buildout.events

### Plone 6.2.3 (`728cf98`)

- `base.cfg` extends the Plone 6.2.3 pins, and buildout.smartweb's `plone62`
  `versions.cfg` and `sources.cfg`. Products.PloneHotfix20261110 is no longer
  installed.
- `requirements.txt` only includes Plone 6.2.3's requirements: the security
  advisory pins (plone.autoform, plone.restapi, plone.app.content, pip,
  certifi) are gone.
- `sources.cfg` checks out imio.events.core, imio.events.policy,
  imio.omnia.core, imio.omnia.tinymce (`submodules=ignore`) and
  imio.smartweb.common from their `plone62` branch.
- `dev.cfg` and `prod.cfg` check out the packages whose releases still call
  `pkg_resources` ([Status](#status)). `versions.cfg` no longer pins
  imio.helpers 1.3.11.
- Dockerfile: base image `plone-base:6.2.3` with Python 3.14, pip 26.3,
  zc.buildout 6.0.2, setuptools 84.2.1 and wheel 0.48.0. Debian packages
  renamed in the new base image: `libpcre3-dev` → `libpcre2-dev`,
  `libmemcached11` → `libmemcached11t64`, `libxml2` → `libxml2-16`.

### plone.observability (`944ff16`)

The same WSGI pipeline as buildout.smartweb: health probes on port 8081
(`/live`, `/ready`, `/startup`), the `@@metrics` endpoint and OpenTelemetry
tracing, inactive until `OTEL_EXPORTER_OTLP_ENDPOINT` is set.

### Image tests and CI

As in buildout.smartweb: `make test`, `tests/`, and the `tests.yml` and
`plone62.yml` workflows ([Testing](#testing)).

### Checkouts dropped

collective.messagesviewlet (its branch was gone, so the image no longer
built), imio.smartweb.locales with its 1.1.51 pin, collective.timedevents and
imio.gdpr. All four now come from the native 2.0.0 releases that
buildout.smartweb pins.

imio.smartweb.common, from `prod.cfg` only: its `plone62` branch was gone
too. The image installs the native 2.0.0, which `versions.cfg` pins in place
of 1.2.65. A dev instance checks out `main`
([details](#clean-up-the-checkouts)).

On 2026-11-20: collective.behavior.talcondition, collective.fingerpointing,
collective.privacy and pas.plugins.kimug, now installed from the native 2.0.0
that buildout.smartweb pins. collective.upgrade is checked out from `master`
(buildout.smartweb's `sources.cfg`) instead of `plone61`, and `dev.cfg`
checks out collective.autopublishing, like `prod.cfg`.

## imio.events.core and imio.events.policy

**Namespaces** `imio`, `imio.events` · **Repositories**
[IMIO/imio.events.core](https://github.com/IMIO/imio.events.core) and
[IMIO/imio.events.policy](https://github.com/IMIO/imio.events.policy), branch
`main` (core) and `plone62` (policy) · **Variant**
[setup.py](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#the-migration-recipe)
· **Checked out by** `dev.cfg`, `prod.cfg` · **Older stacks** (Plone 6.1) stay
on 1.2.x and 1.1.x

Migrated by a colleague on 2026-11-18. Each branch was 3 commits ahead of
`main`:

- PEP 420: `namespace_packages` and the namespace files
  (`src/imio/__init__.py`, `src/imio/events/__init__.py`) are gone.
  setuptools finds the packages itself, and they no longer depend on
  setuptools.
- Their `base.cfg` extends Plone 6.2.3 and buildout.smartweb's `plone62`, and
  checks out the packages whose releases call `pkg_resources` (imio.helpers,
  collective.behavior.talcondition, collective.privacy, and
  collective.timedevents for the policy).
- Classifiers: Plone 6.2 only, and Python 3.14, which the CI matrix now tests.

imio.events.core is merged into `main`
([#18](https://github.com/IMIO/imio.events.core/pull/18)) and released as
**2.0.0** on 2026-11-23. Its `plone62` branch is deleted. `versions.cfg`
still pins 1.2.60 and `sources.cfg` still names `plone62`
([to do](#clean-up-the-checkouts)). imio.events.policy is still on its
`plone62` branch, no PR yet.

## Testing

**Locally**: `make test` builds the production image from this checkout
(`prod.cfg`). It boots the image with Postgres 17, memcached and Solr 9.6, and
collective.big.bang creates the site with `imio.events.policy`. Then it runs:

- the generic checks of
  [IMIO/gha `plone-image-test-notify`](https://github.com/IMIO/gha/tree/v8/plone-image-test-notify);
- `tests/test_events.py`: create an entity, an agenda and an event and
  render them, and find a new event with `@search` (through Solr).

The Solr container downloads the `events` core configuration from
buildout.smartweb when it starts, so the test needs network access.
`tests/log_allowlist.txt` lists the log records that are expected, and why.

Last run 2026-11-20, on `plone62` with the checkouts of 2026-11-20 dropped
(the image installs collective.behavior.talcondition,
collective.fingerpointing and collective.privacy 2.0.0, and checks out
collective.upgrade and collective.autopublishing from `master`): 13 passed
(the 11 generic checks, no pending upgrade step included, and the 2 Events
tests).

**On CI**: each push to `plone62` runs `plone62.yml`. It builds the image
once as `:{short_sha}`, tests it with `tests.yml`, scans it with trivy, and
tags it `:plone62` only if the tests pass. Nothing is deployed. See
[the CI/CD workflows](../.github/workflows/README.md#plone62yml--publish-and-test-plone62-image).
