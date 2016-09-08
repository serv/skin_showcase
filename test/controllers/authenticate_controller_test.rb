require 'test_helper'

class AuthenticateControllerTest < ActionDispatch::IntegrationTest
  test 'should get /signup' do
    get signup_url
    assert_response :success
  end

  test 'should get /signin' do
    get signin_url
    assert_response :success
  end

  test 'should post /signup_post' do
    create_user
    assert_redirected_to root_url
  end

  test 'should post /signin_post with username' do
    user_params = create_user
    params = {
      user: {
        username_or_email: user_params[:username],
        password: user_params[:password]
      }
    }
    assert_redirected_to root_url
  end

  test 'should post /signin_post with email' do
    user_params = create_user
    params = {
      user: {
        username_or_email: user_params[:email],
        password: user_params[:password]
      }
    }
    assert_redirected_to root_url
  end
end
