activate :blog do |blog|
  blog.prefix = 'blog'
  blog.sources = 'articles/:title'
  blog.permalink = "/:title"
  blog.layout = "blog/article"
end

activate :directory_indexes

page '/blog/feed.xml', layout: false
page '404.html', directory_index: false
page 'contact.html'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
# set :images_dir, 'images'
set :build_dir, '/Users/fayimora/Code/fayimora.com'

activate :livereload

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end

helpers do
  def debug anything
    puts anything
    "Meeeeeee"
  end

  def link_to_page name, url
    path = request.path
    current = path =~ Regexp.new('^' + url[1..-1] + '.*\.html')

    #TODO find a way to use the request object to make this more generic
    if path == "index.html" and name == 'Home'
      current = true
    end

    class_name = current ? ' class="current_page_item"' : ''

    "<li#{class_name}><a href=\"#{url}\">#{name}</a></li>"
  end
end
