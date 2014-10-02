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
          target:
            description: """
              The default link target, can be a new window ("_blank"), replace the page ("_self")
              or embedded into a frontend page ("iframe")
            """
            type: "string"
            default: "_blank"
            enum: ["_blank", "iframe", "_self"]
}
