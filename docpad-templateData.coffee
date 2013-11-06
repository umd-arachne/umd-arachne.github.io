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
        site       : "#{sitePrefix}"
        img        : "#{sitePrefix}/img"
        css        : "#{sitePrefix}/css"
        js         : "#{sitePrefix}/js"
        lib        : "#{sitePrefix}/lib"
    }



module.exports = templateData = {
    # Specify some site properties
    site:
        # The production url of our website
        #url:        ''

        
        # Here are some old site urls that you would like to redirect from
        # oldUrls: [
        #     #'www.website.com',
        #     #'website.herokuapp.com'
        # ]

        # The default title of our website
        title:  ''
        
        author: ''

        # The website description (for SEO)
        description: ''

        # The website keywords (for SEO) separated by commas
        keywords: """
            put, keywords, here
            """
        
        prefixes: prefixes()
        
        # Styles
        css: [
            "#{prefixes().css}/index.css"
        ]

        # Scripts
        scripts: [
            "#{prefixes().lib}/jquery.min.js"
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