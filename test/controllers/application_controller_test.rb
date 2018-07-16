require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'should responds with Hello World' do
    get root_url
    assert_response :ok
    assert_select 'h1', 'Hello World!'
  end
end
