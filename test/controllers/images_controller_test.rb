require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.create(url: 'test.com')
  end

  test 'should get index' do
    get images_path
    assert_response :success
    assert_select 'a[href=?]', new_image_path, text: 'New Image'
  end
end
