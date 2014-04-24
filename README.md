pimatic redirect plugin
=======================

Redirect urls:

Config:
-------

    {
      "plugin": "redirect",
      "routes": [
        { 
          "path": "/printer",
          "route": "http://192.168.1.2:631"
        }
      ]
    }