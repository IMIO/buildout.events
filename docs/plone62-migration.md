# Migrating Events to Plone 6.2.3

Tracks the move of Events (branch `plone62`, WEB-4533) to Plone 6.2.3 and
Python 3.14. Most of the work is shared with SmartWeb: this buildout extends
the `plone62` pins and sources of buildout.smartweb, and the packages leave
old-style namespace packages (PEP 420) the way the
[SmartWeb migration guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md)
describes. This page covers only what is specific to Events: the packages it
checks out, what changed in this repository, and what's left before `plone62`
can be merged into `main`.

Last updated: 2026-11-19.

## Status

**17 packages**: **1 done** (released, pinned, no longer checked out) · **4
released and pinned**, still checked out (their checkout can go) · **2
merged**, not released · **4 PRs open** · **6 branches pushed**, no PR yet

✅ done · ⬜ to do · ➖ not applicable · 🚧 its pinned release calls
`pkg_resources` and fails on Plone 6.2.3 · ⚠️ see [What's left](#clean-up-the-checkouts)

| Package | Checked out by | Branch | PR | Merged | Released | Pinned |
|---|:-:|:-:|:-:|:-:|:-:|:-:|
| [imio.events.core](#imioeventscore-and-imioeventspolicy) | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.events.policy](#imioeventscore-and-imioeventspolicy) | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.smartweb.common](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiosmartwebcommon-core-locales-policy) | dev, prod | `plone62` | [#37](https://github.com/IMIO/imio.smartweb.common/pull/37) | ⬜ | ⬜ | ⬜ |
| [imio.omnia.core](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imioomniacore) | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.omnia.tinymce](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imioomniatinymce) | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.helpers](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiohelpers) 🚧 | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.pyutils](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiopyutils) | dev, prod | `master` | [#4](https://github.com/IMIO/imio.pyutils/pull/4) | ✅ | ⬜ | ⬜ |
| [collective.autopublishing](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveautopublishing) | prod | `plone62` | [#12](https://github.com/collective/collective.autopublishing/pull/12) | ⬜ | ⬜ | ⬜ |
| [collective.behavior.talcondition](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivebehaviortalcondition) | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [collective.fingerpointing](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivefingerpointing) 🚧 | dev, prod | `master` | [#110](https://github.com/collective/collective.fingerpointing/pull/110) | ✅ | ⬜ | ⬜ |
| [collective.privacy](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveprivacy) 🚧 | dev, prod | `plone62` | [#22](https://github.com/collective/collective.privacy/pull/22) | ⬜ | ⬜ | ⬜ |
| [collective.upgrade](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveupgrade) | dev, prod | `plone61` | [#20](https://github.com/collective/collective.upgrade/pull/20) | ⬜ | ⬜ | ➖ |
| [collective.messagesviewlet](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivemessagesviewlet) | ➖ | ➖ | [#24](https://github.com/collective/collective.messagesviewlet/pull/24) | ✅ | 2.0.0 | ✅ |
| [collective.timedevents](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivetimedevents) | dev, prod | `master` | [#13](https://github.com/collective/collective.timedevents/pull/13) | ✅ | 2.0.0 | ✅ |
| [imio.gdpr](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiogdpr) | prod | `master` | [#5](https://github.com/IMIO/imio.gdpr/pull/5) | ✅ | 2.0.0 | ✅ |
| [imio.smartweb.locales](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiosmartwebcommon-core-locales-policy) | dev, prod | `main` | [#4](https://github.com/IMIO/imio.smartweb.locales/pull/4) | ✅ | 2.0.0 | ⚠️ |
| [pas.plugins.kimug](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#paspluginskimug) | dev | `main` | [#34](https://github.com/IMIO/pas.plugins.kimug/pull/34) | ✅ | 2.0.0 | ✅ |

Columns:

- **Checked out by**: the `auto-checkout` of `dev.cfg` (dev) and `prod.cfg`
  (prod, so the Docker image). A package checked out by prod only runs as a
  release on a dev instance. ➖: no longer checked out, the pinned release is
  used.
- **Branch**: the branch mr.developer checks out. It comes from this
  repository's `sources.cfg` for the five `imio.events.*`, `imio.omnia.*` and
  `imio.smartweb.common` packages, collective.upgrade and pas.plugins.kimug,
  and from buildout.smartweb's `sources.cfg` for the others.
- **PR**: the pull request that merges the native branch. ⬜: none opened yet.
- **Released**: the native version on PyPI. **Pinned**: a `versions.cfg`
  (this one or buildout.smartweb's) pins it. ➖: collective.upgrade is never
  pinned, every config checks it out.

Each row links to the package's details in the SmartWeb guide, except the two
Events packages, [described below](#imioeventscore-and-imioeventspolicy).

## What's left

### Open pull requests

- [ ] imio.events.core and imio.events.policy: `plone62` into `main`.
- [ ] imio.events.policy's `base.cfg` checks out imio.events.core in a
  `[sources]` section of its own, because "buildout.events has no plone62
  branch yet". It has one now: extend this repository's `sources.cfg` from
  the `plone62` branch instead.

The PRs of the shared packages are tracked in the
[SmartWeb guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#open-pull-requests).

### Clean up the checkouts

- [x] collective.messagesviewlet: dropped from `prod.cfg` (2026-11-19).
  `prod.cfg` checked it out from `plone62`, the branch buildout.smartweb's
  `sources.cfg` names, which was deleted once
  [#24](https://github.com/collective/collective.messagesviewlet/pull/24) was
  merged. mr.developer couldn't clone it, so the image no longer built. The
  image now installs the native 2.0.0 that buildout.smartweb pins.
- [ ] collective.timedevents and imio.gdpr: drop them from `auto-checkout`.
  buildout.smartweb pins their native 2.0.0.
- [ ] imio.smartweb.locales ⚠️: drop it from `auto-checkout` **and** remove
  `imio.smartweb.locales = 1.1.51` from `versions.cfg`, in the same commit.
  `versions.cfg` is extended last, so its 1.1.51 (old-style) overrides the
  2.0.0 that buildout.smartweb pins. Today the checkout hides it.
- [ ] pas.plugins.kimug: drop it from `dev.cfg`, and its line from
  `sources.cfg`, unless you are working on it. buildout.smartweb pins 2.0.0.
- [ ] Make `dev.cfg` and `prod.cfg` check out the same packages. Today only
  prod checks out collective.autopublishing and imio.gdpr, and only dev
  checks out pas.plugins.kimug, so a dev instance doesn't run the code of the
  image.

### Release

When the Plone 6.2 stack goes to production. A PyPI release can't depend on a
git branch, so the order matters:

- [ ] The shared packages first, in the order of the
  [SmartWeb guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#release),
  imio.smartweb.common included.
- [ ] imio.events.core, then imio.events.policy (it requires
  imio.events.core). Release them as 2.0.0, as the SmartWeb guide does for
  the other packages: they drop Plone 6.1. Their `CHANGES.rst` still says
  1.2.61 and 1.1.10.
- [ ] Pin each native release in `versions.cfg`, replacing the old-style
  pins (imio.events.core 1.2.60, imio.events.policy 1.1.9,
  imio.smartweb.common 1.2.65). Then drop the checkout and the `sources.cfg`
  line.

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
`plone62.yml` workflows ([Testing](#testing)). Their first run found that the
image no longer built, so `prod.cfg` no longer checks out
collective.messagesviewlet ([details](#clean-up-the-checkouts)).

## imio.events.core and imio.events.policy

**Namespaces** `imio`, `imio.events` · **Repositories**
[IMIO/imio.events.core](https://github.com/IMIO/imio.events.core) and
[IMIO/imio.events.policy](https://github.com/IMIO/imio.events.policy), branch
`plone62` · **Variant**
[setup.py](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#the-migration-recipe)
· **Checked out by** `dev.cfg`, `prod.cfg` · **Older stacks** (Plone 6.1) stay
on 1.2.x and 1.1.x

Migrated by a colleague on 2026-11-18. Each branch is 3 commits ahead of
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

Last run 2026-11-19, on `plone62` with collective.messagesviewlet no longer
checked out: 13 passed (the 11 generic checks, no pending upgrade step
included, and the 2 Events tests).

**On CI**: each push to `plone62` runs `plone62.yml`. It builds the image
once as `:{short_sha}`, tests it with `tests.yml`, scans it with trivy, and
tags it `:plone62` only if the tests pass. Nothing is deployed. See
[the CI/CD workflows](../.github/workflows/README.md#plone62yml--publish-and-test-plone62-image).
