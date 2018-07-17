require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'Image creation succeeds' do
    img = Image.create(url: 'http://pizzahut.com')
    assert_equal 'http://pizzahut.com', img.url
  end
end
