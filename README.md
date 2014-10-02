pimatic links plugin
=======================

Adds links to the main menu in the mobile frontend.

Config:
-------

```json
{
  "plugin": "links",
  "links": [
    {
      "title": "Rules Guide",
      "url": "http://pimatic.org/guide/usage/rules/",
      "target": "iframe"
    },
    {
      "title": "google.com",
      "url": "http://google.com",
      "target": "_blank"
    },       
  ]
}
```