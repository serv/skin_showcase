require 'test_helper'

class WantitTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_presence_of(:skin_id)

  test 'attributes (persistent)' do
    wantit = Wantit.new
    assert_equal wantit.user_id, nil
    assert_equal wantit.skin_id, nil
  end
end
