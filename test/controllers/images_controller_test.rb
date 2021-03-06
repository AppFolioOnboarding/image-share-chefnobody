require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_data = [
      { url: 'http://www.pizza.com/image1.jpg', tag_list: ['p', 'z', 'a'] },
      { url: 'http://www.pizza.com/image2.jpg', tag_list: ['p', 'z', 'l'] },
      { url: 'http://www.pizza.com/image3.jpg', tag_list: ['i', 'l', 'c'] },
      { url: 'http://www.pizza.com/image4.jpg', tag_list: ['p', 'c'] }
    ].map { |d| 
      Image.create!(url: d[:url], tag_list: d[:tag_list]) 
    }
  end

  test 'should show index page successfully with link to new image' do
    get images_path

    assert_response :success
    assert_select 'a[href=?]', new_image_path, text: 'New Image'
  end

  test 'should show index page with images' do
    get images_path

    assert_select '.js-image-card img' do |images|
      assert_equal images.map { |i| i[:src] }, @image_data.reverse.map(&:url)
    end
  end

  test 'should show index page with tags for images' do
    get images_path

    @image_data.each { |image| 
      # grab tags specific to this image by id
      assert_select ".js-image-#{image.id}-tag" do |tags|
        assert_equal tag_paths_for_image(image), tags.map { |a| a[:href] }
        assert_equal image.tag_list, tags.map(&:text)
      end
    }
  end

  test 'should show correctly ordered and results when filter param exists' do
    get images_path, params: { tag: 'p' }

    assert_select '.js-image-tags', 3

    expected_order = ['http://www.pizza.com/image4.jpg', 'http://www.pizza.com/image2.jpg', 'http://www.pizza.com/image1.jpg']
    
    assert_select '.js-image-card img' do |img|
      assert_equal expected_order, img.map { |i| i[:src] }
    end
  end

  test 'should get new Image form page' do
    get new_image_path
    assert_response :success

    assert_select 'form div input', 2

    assert_select 'form div input' do
      assert_select '[name=?]', 'image[url]'
    end
  end

  test 'should create new Image' do
    params = {
      image: { url: 'http://www.eatpizzanow.com' }
    }
    assert_difference 'Image.count' do
      post images_path, params: params
    end

    assert_redirected_to image_path(Image.last)
  end

  test 'should not create new Image with invalid data' do
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

    assert_select '.js-image-tags a' do |a|
      assert_equal a.map { |a| a[:href] }, tag_paths_for_image(image)
    end
  end

  private 

  def tag_paths_for_image(image = Image.new)
    image[:tag_list].map { |t| images_path(tag: t) }
  end
end
