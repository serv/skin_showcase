class User < ApplicationRecord
  attr_accessor :password_confirmation

  has_secure_password
end
