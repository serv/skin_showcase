require 'test_helper'

class HelpfulTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_presence_of(:review_id)
  should validate_presence_of(:upvote)

  test 'attributes (persistent)' do
    helpful = Helpful.new
    assert_equal helpful.user_id, nil
    assert_equal helpful.review_id, nil
    assert_equal helpful.upvote, nil
  end
end
