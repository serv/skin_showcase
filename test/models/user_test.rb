require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'attributes (persistent)' do
    user = User.new
    assert_equal user.username, nil
    assert_equal user.password_digest, nil
    assert_equal user.email, nil
    assert_equal user.ref_owned_skins, nil
    assert_equal user.ref_wanted_skins, nil
    assert_equal user.ref_ratings, nil
    assert_equal user.ref_comments, nil
    assert_equal user.ref_friends, nil
  end

  test 'attributes (transient)' do
    user = User.new
    assert_equal user.password_confirmation, nil
  end
end
