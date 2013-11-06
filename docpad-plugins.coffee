
module.exports = plugins = {
    
    coffeescript:
        compileOptions:
            bare: true
            
    ghpages:
        deployRemote: 'origin'
        deployBranch: 'master'
    
    highlightjs:
        aliases:
            haml:   'xml'
            less:   'css'
            stylus: 'css'
            styl:   'css'
            md:     'markdown'
}