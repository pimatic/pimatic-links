module.exports = (env) ->

  Promise = env.require 'bluebird'
  assert = env.require 'cassert'

  class LinksPlugin extends env.plugins.Plugin

    init: (app, @framework, @config) =>
      _this = this

      @framework.on "after init", =>
        mobileFrontend = @framework.pluginManager.getPlugin 'mobile-frontend'
        if mobileFrontend?
          mobileFrontend.registerAssetFile 'js', "pimatic-links/app/add-links.coffee"
          mobileFrontend.registerAssetFile 'html', "pimatic-links/app/iframe-page.jade"
          mobileFrontend.registerAssetFile 'css', "pimatic-links/app/iframe-page.css"
        else
          env.logger.warn "links could not find mobile-frontend. Didn't add links."

      app.get('/links/get', (req, res) =>
        res.send(@config.links)
      )



  return new LinksPlugin