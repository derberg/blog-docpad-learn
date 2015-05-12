# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
  # =================================
  # Templates

  # set of variables and custom helper methods accessible through templates
  templateData:

    # tracking codes that for local development should not be included
    tracking:
      google: ''
      inspectlet: ''


    # Specify some site properties
    blog:

      # values for seo
      author: 'Lukasz Gornicki'
      title: 'exTW Blog: How to build a documentation portal with DocPad?'
      description: 'This blog provides instructions on how you could use DocPad
       to build a kick-ass documentation portal. It is about all the technical
       and not technical concepts related to awesome DocPad generator.'

      # Scripts
      scripts: [
        "/js/jquery.min.js"
        "/js/bootstrap.min.js"
        "/js/clean-blog.min.js"]

      # Styles
      styles: [
        "/css/bootstrap.min.css"
        "/css/clean-blog.min.css"]

    #helpers for tracking codes
    getTrackGoogle: ->
      @tracking.google

    getTrackInspectlet: ->
      @tracking.inspectlet

    #helper for listing of all blogs
    #Do not used any more, just keep it in the code for a reference for others
    getCuttedContent: (content) ->
      content.substr(0, 250);

    #helpers for seo
    getAuthor: ->
      # if there is an author metadata provided,
      # then we should use that value in seo settings
      if @document.author
        "#{@document.author} | #{@blog.author}"
      # if our document does not have it's own title,
      # then we should just use the site's title
      else
        @blog.title

    getDescription: ->
      # if we have a document title,
      # then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} | #{@blog.title}"
      # if our document does not have it's own title,
      # then we should just use the site's title
      else
        @blog.title

    getTitle: ->
      # if we have a document title,
      # then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} | #{@blog.title}"
      # if our document does not have it's own title,
      # then we should just use the site's title
      else
        @blog.title


	# =================================
	# Collections

	# defined collections of documents/files
  # that are used to gather specific set of files
  collections:

    # Get all blogposts sorted by filename
    posts: ->
      @getCollection("html")
        .findAllLive(
          {basename:{$ne: "index"},
          relativeOutDirPath:"posts",
          title:{$exists:true}},
          [filename:-1])

  # =================================
  # Plugins

  # all docpad plugins custom config
  plugins:
    #plugin for github pages deployment
    ghpages:
      deployRemote: 'target'
      deployBranch: 'master'
      environment: 'production'

  # custom configuration for specific environmetns
  environments:
    production:
      templateData:
        tracking:
          google: "<script>(function(i,s,o,g,r,a,m)
            {i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();
            a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;
            a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script',
            '//www.google-analytics.com/analytics.js','ga');
            ga('create', 'UA-62858836-1', 'auto');
            ga('send', 'pageview');</script>"

          inspectlet: "<script type='text/javascript' id='inspectletjs'>
            window.__insp = window.__insp || [];
            __insp.push(['wid', 1668565138]);
            (function() {
            function __ldinsp(){var insp = document.createElement('script');
            insp.type = 'text/javascript'; insp.async = true;
            insp.id = 'inspsync';
            insp.src = ('https:'
            == document.location.protocol ? 'https' : 'http')
            + '://cdn.inspectlet.com/inspectlet.js';
            var x = document.getElementsByTagName('script')[0];
            x.parentNode.insertBefore(insp, x); }
            if (window.attachEvent) window.attachEvent('onload', __ldinsp);
            else window.addEventListener('load', __ldinsp, false);
            })();
            </script>"


        #helpers for tracking codes
        getTrackGoogle: ->
          @tracking.google

        getTrackInspectlet: ->
          @tracking.inspectlet

}

# Export the DocPad Configuration
module.exports = docpadConfig
