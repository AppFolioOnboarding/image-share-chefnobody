require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'Image creation succeeds' do
    img = Image.create(url: 'http://pizzahut.com')
    assert_equal 'http://pizzahut.com', img.url
  end

  test 'Image creation fails with invalid url' do
    image = Image.create(url: nil)
    assert_equal ["can't be blank", 'is not a valid URL'], image.errors[:url]
  end

  test 'Image creation succeeds when tags are present' do
    image = Image.create(url: 'http://www.pizzahut.com', tag_list: ['cheesy', 'pepperoni-y', 'salty'])
    assert_equal ['cheesy', 'pepperoni-y', 'salty'], image.tag_list
  end
end
