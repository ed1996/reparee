require 'test_helper'

class FacturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get factures_index_url
    assert_response :success
  end

  test "should get show" do
    get factures_show_url
    assert_response :success
  end

end
