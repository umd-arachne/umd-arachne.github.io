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

freebies = {
    "Buttons": [
        {
            "name": "Round Jewels"
            "urlPrefix": "/buttons/round_jewels"
            "alt": "round button"
        }
      ,
        {
            "name": "Square Jewels"
            "urlPrefix": "/buttons/square_jewels"
            "alt": "square button"
        }
    ]

    "Icons": [
        {
            "name": "Computer Icons"
            "urlPrefix": "/jenae-icons/Computer_Icons"
            "alt": "computer icons"
        }
      ,
        {
            "name": "Design Icons"
            "urlPrefix": "/jenae-icons/Design_Icons"
            "alt": "design icons"
        }
      ,
        {
            "name": "Writing Icons"
            "urlPrefix": "/jenae-icons/Writing_Icons"
            "alt": "writing icons"
        }
    ]

    "Patterns": [
        {
            "name": "Chain Weave"
            "urlPrefix": "/patterns/chain_weave"
            "alt": "chain weave"
        }
      ,
        {
            "name": "Circles"
            "urlPrefix": "/patterns/circles"
            "alt": "circles"
        }
      ,
        {
            "name": "Cooking"
            "urlPrefix": "/patterns/cooking"
            "alt": "cooking"
        }
      ,
        {
            "name": "Diagonal Stripes"
            "urlPrefix": "/patterns/diagonal_stripes"
            "alt": "diagonal stripes"
        }
      ,
        {
            "name": "Greek Double Key"
            "urlPrefix": "/patterns/greek_double_key"
            "alt": "Greek double key"
        }
      ,
        {
            "name": "Hatching"
            "urlPrefix": "/patterns/hatching"
            "alt": "hatching"
        }
      ,
        {
            "name": "Hexagons"
            "urlPrefix": "/patterns/hexagons"
            "alt": "hexagons"
        }
      ,
        {
            "name": "Japanese"
            "urlPrefix": "/patterns/japanese"
            "alt": "Japanese"
        }
      ,
        {
            "name": "Lorem Ipsum"
            "urlPrefix": "/patterns/lorem_ipsum"
            "alt": "Lorem ipsum"
        }
      ,
        {
            "name": "Maple"
            "urlPrefix": "/patterns/maple"
            "alt": "maple"
        }
      ,
        {
            "name": "Oak"
            "urlPrefix": "/patterns/oak"
            "alt": "oak"
        }
      ,
        {
            "name": "Ovals"
            "urlPrefix": "/patterns/ovals"
            "alt": "ovals"
        }
      ,
        {
            "name": "Pointillism"
            "urlPrefix": "/patterns/pointillism"
            "alt": "pointillism"
        }
      ,
        {
            "name": "Trees"
            "urlPrefix": "/patterns/trees"
            "alt": "trees"
        }
      ,
        {
            "name": "Vertical Stripes"
            "urlPrefix": "/patterns/vertical_stripes"
            "alt": "vertical stripes"
        }
      ,
        {
            "name": "Volume"
            "urlPrefix": "/patterns/volume"
            "alt": "volume"
        }
      ,
        {
            "name": "Watercolors"
            "urlPrefix": "/patterns/watercolors"
            "alt": "watercolors"
        }

    ]

    "Stock Photos": [
        {
            "name": "Audio"
            "urlPrefix": "/stock/audio"
            "alt": "audio"
        }
      ,
        {
            "name": "Digital"
            "urlPrefix": "/stock/digital"
            "alt": "digital"
        }
      ,
        {
            "name": "Drafting"
            "urlPrefix": "/stock/drafting"
            "alt": "drafting"
        }
      ,
        {
            "name": "Drawing"
            "urlPrefix": "/stock/drawing"
            "alt": "drawing"
        }
      ,
        {
            "name": "Fashion"
            "urlPrefix": "/stock/fashion"
            "alt": "fashion"
        }
      ,
        {
            "name": "Painting"
            "urlPrefix": "/stock/painting"
            "alt": "painting"
        }
      ,
        {
            "name": "Photography"
            "urlPrefix": "/stock/drawing"
            "alt": "photography"
        }
      ,
        {
            "name": "Writing"
            "urlPrefix": "/stock/written"
            "alt": "written"
        }
    ]
}



module.exports = templateData = {
    # Specify some site properties
    site:
        url:        'http://umd-arachne.github.io'

        
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
        
        freebies: freebies

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