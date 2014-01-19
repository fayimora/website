require('./lib/custom_hepers')

Time.zone = "London"

activate :blog do |blog|
  blog.prefix = 'blog'
  blog.sources = 'articles/:title'
  blog.permalink = "/:title"
  blog.layout = "blog/article"
end

activate :directory_indexes
activate :syntax, line_numbers: true
activate :custom_helpers

page '/blog/feed.xml', layout: false
page '404.html', directory_index: false
page 'contact.html'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
# set :images_dir, 'images'
set :build_dir, '/Users/fayimora/Code/fayimora.com'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :strikethrough => true

activate :livereload

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end

helpers do
  def debug obj
    puts obj.inspect
  end

  # TODO Improve this helper. This is more/less a hack!
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
