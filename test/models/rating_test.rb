require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  should validate_presence_of(:skin_id)
  should validate_presence_of(:user_id)
  should validate_presence_of(:score)

  test 'attributes (persistent)' do
    rating = Rating.new
    assert_equal rating.skin_id, nil
    assert_equal rating.user_id, nil
    assert_equal rating.review_id, nil
    assert_equal rating.score, nil
  end
end
