require 'spec_helper'
require 'content_driven'

describe ContentDriven::Page do
  before do
    @content = ContentDriven::Site.new do

    end
  end

  it "Can be output as html" do
    html = @content.ebook :html
    expect(html.class).to be(String)
  end

  it "Can be output as an epub" do
    epub = @content.ebook :epub
    expect(epub.class).to be(String)
  end
end