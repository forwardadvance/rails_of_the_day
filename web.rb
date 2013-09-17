require 'sinatra'
require './content'
require 'tilt'

configure do
end

get '/' do
  blog_post = blog.last_post
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
  blog_post = blog.post(url)
  haml :"posts/#{blog_post.url}",
    layout: :"layout.html",
    locals: {blog_post: blog_post}
end

def blog
  @blog ||= Content.blog
  @blog
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