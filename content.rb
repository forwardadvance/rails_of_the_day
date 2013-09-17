class Blog

  attr_accessor :posts

  def initialize &block
    self.posts = {}
    self.instance_eval &block
  end

  def add_post key, &block
    self.posts[key] = BlogPost.new(key, &block)
  end

  def post key
    self.posts[key]
  end

  def last_post
    self.posts.values.last
  end
end

class BlogPost

  attr_accessor :title, :date, :url

  def initialize key, &block
    self.url = key
    self.instance_eval &block
  end
end

class Content
  class << self
    def blog
      Blog.new do
        add_post :shuffling_up do
          self.title = "Shuffling up method params with parallel assignation"
          self.date = DateTime.new(2013,9,17)
        end
      end
    end
  end
end