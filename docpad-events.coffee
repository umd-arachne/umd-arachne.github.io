# =================================
# DocPad Events
#
# Here you can define handlers for DocPad events.
# http://docpad.org/docs/events

#
# Events fire in the following order:
# ----------------------------------- 
# extendTemplateData
# extendCollections
# docpadLoaded
# docpadReady
# docpadDestroy
# consoleSetup
# generateBefore
# populateCollectionsBefore
# populateCollections
# generateAfter
# parseBefore
# parseAfter
# contextualizeBefore
# contextualizeAfter
# renderBefore
# render                        # fired per extension conversion

# renderDocument                # fired per document render after all extension conversions, 
#                               # including layouts and render passes. 
#                               # Used to perform transformations to the entire document.

# renderAfter
# writeBefore
# writeAfter
# serverBefore
# serverExtend
# serverAfter
#

events = {
    
    # Add custom server routes before the docpad's routes get added
    serverExtend: (opts) ->
        {server} = opts
        docpad   = @docpad

        # Since we're now running in an event,
        # ensure docpad's configuration is up-to-date, 
        # and fetch our urls
        latestConfig = docpad.getConfig()
        templateData = latestConfig.templateData.site
        oldUrls      = templateData.oldUrls or []
        newUrl       = templateData.url

        # Redirect any requests accessing one of our sites oldUrls to the new site url
        server.use (req,res,next) ->
            if req.headers.host in oldUrls
                url = newUrl + req.url
                res.redirect(url, 301)
            else
                next()
    
    #generateAfter: ->
    #   for item in docpad.getCollection('design').toJSON()
    #       console.log()
    #       console.log()
    #       for own key, value of item
    #           unless key in ['source', 'header', 'meta', 'body', 'content', 'contentRendered', 'contentRenderedWithoutLayouts']
    #               console.log("\t#{key}: #{value}") 
        
    #renderDocument: (opts) ->
    #    {extension, templateData, file, content} = opts
    #    if 'freebies' in opts.templateData?
    #        console.log()
    #        console.log( templateData )
    #        console.log()
        

    #   render
    #   ------
    #   Called per document, for each extension conversion. 
    #   Used to render one extension to another. 
    #
    #   Options:
    #     inExtension     the extension we are rendering from
    #     outExtension    the extension we are rendering to
    #     templateData    the template data that we will use for this document's rendering
    #     file            the model instance for the document we are rendering
    #     content         the current content that this document contains;
    #                     you shall overwrite this option with any updates you do
    #render: (opts) ->
    #    docpad = @docpad
    #    if 'freebies' in opts.templateData?
    #        console.log()
    #        console.log(freebies)
}

module.exports = events