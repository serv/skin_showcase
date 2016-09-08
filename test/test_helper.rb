ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'faker'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def create_user
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
    params[:user]
  end
end
