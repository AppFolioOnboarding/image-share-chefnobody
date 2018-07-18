require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.create(url: 'test.com')
  end

  test 'should show index page with images' do
    urls = [
      'http://www.pizza.com/image1.jpg',
      'http://www.pizza.com/image2.jpg',
      'http://www.pizza.com/image3.jpg',
      'http://www.pizza.com/image4.jpg'
    ]

    urls.each { |url| Image.create!(url: url) }

    get images_path

    assert_response :success

    assert_select 'div img' do |images|
      assert_equal images.map { |i| i[:src] }, urls.reverse
    end

    assert_select 'a[href=?]', new_image_path, text: 'New Image'
  end

  test 'should show index page with images and tags' do
    data = [
      { url: 'http://www.pizza.com/image1.jpg', tag_list: ['1', '2', '3'] },
      { url: 'http://www.pizza.com/image2.jpg', tag_list: ['4', '5', '6'] },
      { url: 'http://www.pizza.com/image3.jpg', tag_list: ['7', '8', '9'] },
      { url: 'http://www.pizza.com/image4.jpg', tag_list: ['10', '11'] }
    ]

    data.each { |d| Image.create!(url: d[:url], tag_list: d[:tag_list]) }

    get images_path

    assert_response :success

    assert_select 'div .js-image-tags' do |tags|
      assert_equal tags.map { |t| t.text }, data.reverse.map { |d| "Tags: #{d[:tag_list].join(', ')}" }
    end

    assert_select 'a[href=?]', new_image_path, text: 'New Image'
  end

  test 'should get new' do
    get new_image_path
    assert_response :success

    assert_select 'form div input', 2

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

    assert_redirected_to image_path(Image.last)
  end

  test 'should not create new with invalid data' do
    params = {
      image: { url: nil }
    }

    assert_no_difference 'Image.count' do
      post images_path, params: params
    end

    assert_select 'div[class=?]', 'invalid-feedback', text: "Url can't be blank and Url is not a valid URL"
  end

  test 'should show image' do
    image = Image.create(url: 'http://www.gooffroadingwithpizza.com', tag_list: ['pizza', 'cheese'])
    get image_path(image)
    assert_response :ok
    assert_select 'img' do
      assert_select '[src=?]', image.url
    end

    assert_select '.js-image-tags', text: "Tags: #{image.tag_list.join(', ')}"
  end
end
