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
    fake_password = Faker::Internet.password
    params = {
      user: {
        username: Faker::Internet.user_name,
        email: Faker::Internet.email,
        password: fake_password,
        password_confirmation: fake_password
      }
    }
    post signup_post_url, { params: params }
    assert_redirected_to root_url
  end
end
