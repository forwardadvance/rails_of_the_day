require 'sinatra'
require './content'
require 'tilt'
require 'sodium'
require 'pry'
require 'debugger'

configure do
end

def site
  return @site ||= Sodium::Site.new do
    add_blog :rails do
      puts "init_blog"
      add_blog_post :shuffling_up do
        puts "init_blog_post"
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

    end
  end
end

def blog
  site.get_blog :rails
end

get '/' do
  blog_post = blog.get_blog_post :is_a
  haml :"posts/#{blog_post.url}",
    layout: :"layout.html",
    locals: {blog_post: blog_post}
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