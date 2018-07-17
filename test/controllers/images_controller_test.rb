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

  test 'should get new' do
    get new_image_path
    assert_response :success

    assert_select 'form div input', 1

    assert_select 'form div input' do
      assert_select '[name=?]', 'image[url]'
    end
  end

  test 'should create new' do
    params = {
      image: { url: 'http://www.eatpizzanow.com' }
    }
    assert_difference 'Image.count' do
      post images_path, params: params
    end
  end

end
