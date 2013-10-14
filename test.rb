class Test

  attr_accessor :children
  @@i = 0;
  def initialize &block
    if block_given?
      puts @@i += 1
      @children[@@i] = self
      self.instance_eval &block
    end
    puts @children
  end

end

a = Test.new do
  Test.new do
    Test.new do
      Test.new do
      end
    end
  end
end

puts a.children