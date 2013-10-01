module Sodium
  module DSL

    content_types = ContentTypes.content_types

    content_types.each do |type|
      define_method type, key, &block do
        content_class = Sodium.const_get type
        add_child content_class.new &block
        self.children[key] = Blog.new &block
      end
      def blog key, &block
        add_child Blog.new &block
        self.children[key] = Blog.new &block
      end
    end
  end
end