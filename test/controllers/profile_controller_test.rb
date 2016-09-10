require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test 'should get /profile' do
    user_params = create_user
    get profile_url
    assert_response :success
  end
end
