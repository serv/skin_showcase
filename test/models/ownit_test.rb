require 'test_helper'

class OwnitTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_presence_of(:skin_id)

  test 'attributes (persistent)' do
    ownit = Ownit.new
    assert_equal ownit.user_id, nil
    assert_equal ownit.skin_id, nil
  end
end
