require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_presence_of(:skin_id)
  should validate_presence_of(:title)
  should validate_presence_of(:long_form)

  test 'attributes (persistent)' do
    review = Review.new
    assert_equal review.user_id, nil
    assert_equal review.skin_id, nil
    assert_equal review.title, nil
    assert_equal review.long_form, nil
  end
end
