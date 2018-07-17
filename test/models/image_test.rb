require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'Image creation succeeds' do
    img = Image.create(url: 'http://pizzahut.com')
    assert_equal 'http://pizzahut.com', img.url
  end

  test 'Image creation fails with invalid url' do
    image = Image.create(url: nil)
    assert_equal ["can't be blank"], image.errors[:url]
  end
end
