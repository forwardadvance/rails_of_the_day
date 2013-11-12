require 'sinatra'
require './content'
require 'tilt'
require "rubygems"
require 'content_driven'
require 'content_driven_sinatra'
require 'pry'
require 'debugger'

configure do
end

def site
  return @site ||= ContentDriven::Site.new do
    add_blog :rails do
      add_blog_post :shuffling_up do
        self.title = "Shuffling up method params with parallel assignation"
        self.date = DateTime.new(2013,9,17)
      end
      add_blog_post :is_a do
        self.title = "Using is_a? to vet method params"
        self.date = DateTime.new(2013,9,18)
      end
      add_blog_post :blank do
        self.title = "Using Object#blank? to check for whitespace"
        self.date = DateTime.new(2013,9,19)
      end
      add_blog_post :include_vs_extend do
        self.title = "Include vs. Extend"
        self.date = DateTime.new(2013,9,24)
      end
      add_blog_post :delegating_with_extend do
        self.title = "Delegating methods using extend"
        self.date = DateTime.new(2013,9,25)
      end
      add_blog_post :bang_dup do
        self.title = "Using dup to dry up bang methods. Bang bang!"
        self.date = DateTime.new(2013,10,17)
      end

    end
  end
end

ContentDriven::Page.after do |page|
  puts "***"
  puts page
end

def blog
  site.get_blog :rails
end

get '/' do
  post_count = blog.get_blog_posts.length
  post_number = (Date.today - Date.new(2013,9,10)).to_i % post_count
  url = blog.get_blog_posts.keys[post_number]
  blog_post = blog.get_blog_post url
  haml :"posts/#{blog_post.url}",
    layout: :"layout.html",
    locals: {blog_post: blog_post, post_number: post_number}
end

get '/rails.css' do
  content_type 'text/css'
  Tilt.new('stylesheets/rails.css.scss').render
end

get '/*' do
  url = params[:splat][0].to_sym
  blog_post = blog.get_blog_post(url)
  haml :"posts/#{blog_post.url}",
    layout: :"layout.html",
    locals: {blog_post: blog_post}
end


helpers do
  def code code
    output = ""
    code.gsub!(/ (class|module|def|do|end|new|if|elsif|else|unless) /) do |match|
      "<strong>#{match}</strong>"
    end
    code.gsub!(/'.*?'|".*?"/) do |match|
      "<em>#{match}</em>"
    end
    output << "<pre><code contenteditable=\"true\" tabindex=\"0\" spellcheck=\"false\">"
    code.split("\n").each do |line|
      formatted_line = "<div class='line'>" + line + "</div>"
      output << formatted_line
    end
    output << "</pre></code>"
  end
end