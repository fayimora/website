activate :blog do |blog|
  blog.prefix = 'blog'
  blog.sources = 'articles/:title'
  blog.permalink = "/:title"
end

activate :directory_indexes

page '/blog/feed.xml', layout: false
page '404.html', directory_index: false
page 'contact.html'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :livereload

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end
