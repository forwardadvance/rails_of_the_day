require 'sodium_dsl'
class Content
  class << self
    def website
      Sodium::Site.new do
        add_blog :rails do
          add_post :shuffling_up do
            self.title = "Shuffling up method params with parallel assignation"
            self.date = DateTime.new(2013,9,17)
          end
          add_post :is_a do
            self.title = "Using is_a? to vet method params"
            self.date = DateTime.new(2013,9,18)
          end
          add_post :blank do
            self.title = "Using Object#blank? to check for whitespace"
            self.date = DateTime.new(2013,9,19)
          end
          add_post :include_vs_extend do
            self.title = "Include vs. Extend"
            self.date = DateTime.new(2013,9,24)
          end
          add_post :delegating_with_extend do
            self.title = "Delegating methods using extend"
            self.date = DateTime.new(2013,9,25)
          end

        end
      end
    end
  end
end