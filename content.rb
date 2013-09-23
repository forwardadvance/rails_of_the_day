class Content
  class << self
    def blog
      Blog.new do
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
      end
    end
  end
end