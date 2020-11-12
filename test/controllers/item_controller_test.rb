require 'test_helper'

class ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get item_page_url
    assert_response :success
  end

end
