require 'test_helper'

class TanslateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tanslate_index_url
    assert_response :success
  end

end
