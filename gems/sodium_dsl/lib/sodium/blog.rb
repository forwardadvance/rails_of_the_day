module Sodium

  class Blog < Node

    def add_blog_post key, &block
      post = BlogPost.new
      parent.(key, &block)
      post.blog = self
      self.posts[key] = post
    end

    def blog_post key
      self.posts[key]
    end

    def last_blog_post
      blog_posts.values.last
    end

    def next_blog_post key
      keys = post.keys
      self.posts[keys[keys.index_of(key) + 1]]
    end

    def prev_blog_post key
      keys = post.keys
      self.posts[keys[keys.index_of(key) + 1]]
    end


    # Convenience shorthand methods
    alias_method :add_post,  :add_blog_post
    alias_method :next_post, :next_blog_post
    alias_method :prev_post, :prev_blog_post
    alias_method :post,      :blog_post
    alias_method :last_post, :last_blog_post
    alias_method :last_post, :last_blog_post
  end
end