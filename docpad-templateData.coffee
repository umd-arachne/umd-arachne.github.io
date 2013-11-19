# =================================
# Template Data
#
# These variables are accessible in your templates.
#
# To access them from your templates, refer to the FAQ:
# https://github.com/bevry/docpad/wiki/FAQ
#

sitePrefix = ''

prefixes = ->
    return {
        root       : "#{sitePrefix}"
        img        : "#{sitePrefix}/img"
        css        : "#{sitePrefix}/css"
        js         : "#{sitePrefix}/js"
        lib        : "#{sitePrefix}/lib"
        bootstrap  : "#{sitePrefix}/lib/bootstrap"
    }



module.exports = templateData = {
    # Specify some site properties
    site:
        url:        'https://umd-arachne.github.io'

        
        # The default title of our website
        title:  'Arachne Web Development'
        
        author: 'The Arachne Project'

        # The website description (for SEO)
        description: ''

        # The website keywords (for SEO) separated by commas
        keywords: """
            put, keywords, here
            """
        
        prefixes: prefixes()
        
        # Styles
        css: [
            "#{prefixes().bootstrap}/css/bootstrap.min.css"
            "#{prefixes().css}/index.css"
        ]

        # Scripts
        scripts: [
            "#{prefixes().lib}/jquery/jquery.min.js"
            "#{prefixes().bootstrap}/js/bootstrap.min.js"
            "#{prefixes().js}/index.js"
        ]

    # -----------------------------
    # Helper Functions

    
    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page's title
    # we can apply that formatting here
    getPreparedTitle: ->
        # if we have a document title, use it, and suffix the site's title onto it
        if @document.title
            "#{@document.title} | #{@site.title}"
        # if a document doesn't have its own title, just use the site title
        else
            @site.title

    
    # Get the prepared site/document description
    getPreparedDescription: ->
        # if we have a document description, then we should use that, otherwise use the site's description
        @document.description or @site.description

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
        # Merge the document keywords with the site keywords
        @site.keywords.concat(@document.keywords or []).join(', ')
}