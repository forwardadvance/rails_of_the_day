require 'spec_helper'
require 'content_driven'

describe ContentDriven::Page do
  before do
    @content = ContentDriven::Site.new do

    end
  end

  it "Can be flattened" do
    flat = @content.flatten
  end

  it "Can be output as html" do

  end
end