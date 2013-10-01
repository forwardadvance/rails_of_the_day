module Sodium
  module Delegator
    def delegate target *methods
      args.each do |method|
        self.define_method method |*args, &block| do
          target.send method, *args, &block
        end
      end
    end
  end
end

delegate add_blog