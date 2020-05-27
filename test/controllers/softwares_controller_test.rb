require 'test_helper'

class SoftwaresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get softwares_new_url
    assert_response :success
  end

  test "should get edit" do
    get softwares_edit_url
    assert_response :success
  end

end
