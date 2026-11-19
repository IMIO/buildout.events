"""Events checks, run by `make test` after the generic image checks.

The fixtures (`site_url`, `admin`) come from the pytest plugin of
IMIO/gha plone-image-test-notify.
"""

import uuid

TIMEOUT = 60
HTML = {"Accept": "text/html"}
START = "2030-06-01T10:00:00+00:00"
END = "2030-06-01T12:00:00+00:00"


def create(admin, container_url, portal_type, title, **fields):
    response = admin.post(
        container_url,
        json={"@type": portal_type, "title": title, **fields},
        timeout=TIMEOUT,
    )
    assert response.status_code == 201, response.text
    return response.json()["@id"]


def create_agenda(admin, site_url):
    # zip_codes is required: a token of the imio.smartweb.vocabulary.Cities vocabulary.
    entity = create(
        admin, site_url, "imio.events.Entity", "Test entity", zip_codes=["5000"]
    )
    return entity, create(admin, entity, "imio.events.Agenda", "Test agenda")


def test_create_and_render(admin, site_url):
    entity, agenda = create_agenda(admin, site_url)
    event = create(
        admin, agenda, "imio.events.Event", "Test event", start=START, end=END
    )
    for url in (entity, agenda, event):
        response = admin.get(url, headers=HTML, timeout=TIMEOUT)
        assert response.status_code == 200, url


def test_search_finds_new_event(admin, site_url):
    _, agenda = create_agenda(admin, site_url)
    title = f"search-{uuid.uuid4().hex}"
    create(admin, agenda, "imio.events.Event", title, start=START, end=END)
    response = admin.get(
        f"{site_url}/@search", params={"SearchableText": title}, timeout=TIMEOUT
    )
    response.raise_for_status()
    assert [item["title"] for item in response.json()["items"]] == [title]
