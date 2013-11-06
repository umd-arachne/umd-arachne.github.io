# The DocPad Configuration File
# It's just a CoffeeScript Object, parsed by CSON

#   These files hold the actual settings
collections = require('./docpad-collections')
events      = require('./docpad-events')
plugins     = require('./docpad-plugins')
templateData= require('./docpad-templateData')


module.exports = docpadConfig = {
    global: true
    skipUnsupportedPlugins: false
    
    # =================================
    # Template Data
    #
    # Variables are accessible in your templates
    # https://github.com/bevry/docpad/wiki/FAQ
    templateData: templateData


    # =================================
    # DocPad Collections
    collections: collections
        
    # =================================
    # DocPad Plugins
    plugins: plugins

    # =================================
    # DocPad Events
    #
    # Handlers for DocPad events
    # You can find a full listing of events on the DocPad Wiki
    events: events
}