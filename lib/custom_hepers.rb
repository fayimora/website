require "redcarpet"

module CustomHelpers# < Middleman::Extension
  class << self
    def registered(app)
      app.helpers Helpers
    end
    alias :included :registered
  end

  # def initialize(app, options_hash={}, &block)
  #   super
  # end
  # alias :included :registered

  module Helpers
    def md(string)
      unless string.nil?
        Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                :layout_engine => :erb,
                                :fenced_code_blocks => true,
                                :strikethrough => true,
                                :lax_html_blocks => true).render(string)
      end
    end
  end
end

::Middleman::Extensions.register(:custom_helpers, CustomHelpers)
