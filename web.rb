require 'sinatra'
require './content'
require 'tilt'

configure do
end

get '/' do
  blog_post = blog.last_post
  haml :"posts/#{blog_post.url}.html",
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
  haml :"posts/#{blog_post.url}.html",
    layout: :"layout.html",
    locals: {blog_post: blog_post}
end

def blog
  @@blog |= Content.blog
  @@blog
end