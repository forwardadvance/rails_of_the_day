
module ContentDriven
  module Hooks
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      attr :after_hooks
      def after_hooks
        @after_hooks ||= []
      end
      def after &block
        after_hooks << block
      end
    end

    def call_after_hooks
      self.class.after_hooks.each do |hook|
        self.instance_eval &hook, self
      end
    end
  end
end
