# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {

  # =================================
  # Templates

  # set of variables and custom helper methods accessible through templates
  templateData:

    # Specify some site properties
    blog:

      # Scripts
      scripts: [
        "/js/jquery.js"
        "/js/bootstrap.min.js"
        "/js/clean-blog.min.js"]

      # Styles
      styles: [
        "/css/bootstrap.min.css"
        "/css/clean-blog.min.css"]

    #helpers
    getCuttedContent: (content) ->
      content.substr(0, 300);

	# =================================
	# Collections

	# defined collections of documents/files
  # that are used to gather specific set of files
  collections:

    # Get all blogposts sorted by order meta
    posts: ->
      @getCollection("html")
        .findAllLive(
          {basename:{$ne: "index"},
          relativeOutDirPath:"posts"},
          [filename:-1])

}

# Export the DocPad Configuration
module.exports = docpadConfig
