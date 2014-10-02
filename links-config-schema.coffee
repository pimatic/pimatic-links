module.exports = {
  title: "links config options"
  type: "object"
  properties: 
    links:
      description: "Array of links to add to the mobile frontend menu"
      type: "array"
      default: []
      items:
        type: "object"
        properties:
          title:
            description: "The name of the Link"
            type: "string"
          url:
            description: "The url to link to, should start with http:// or https://"
            type: "string"
}
