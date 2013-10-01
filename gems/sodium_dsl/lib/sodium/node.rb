module Sodium

  # Sodium defines a tree of content. Node is the base class.
  # A Node has a parent and zero or more children
  class Node
    attr_accessor :parent, :children

    def initialize parent,
      self.children = {}
    end

    # Allows us to call methods like site.blogs and blog.blog_posts
    def self.inherited(subclass)
      self.define_method subclass.to_s.underscore.pluralise.to_sym do
        children.delete_if do |child|
          !child.is_a? subclass
        end
      end
    end

    def add_child key, node = nil, &block
      if key.is_a? Node
        node, key = key, children.keys.length.to_sym
      end
      node.parent = self
      node.url = key
      node.init &block
      children[key] = node
    end

    private

      def init &block
        if block_given?
          self.instance_eval &block
        end
      end

  end
end