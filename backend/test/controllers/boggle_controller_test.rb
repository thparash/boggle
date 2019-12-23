require 'test_helper'

class BoggleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get boggle_new_url
    assert_response :success
  end

end
