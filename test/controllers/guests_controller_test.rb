require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get invite" do
    get guests_invite_url
    assert_response :success
  end

end
