require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test 'should be redirected when not signed in /profile' do
    get profile_url
    assert_redirected_to signin_path
  end
end
