require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test 'attributes (transient)' do
    search = Search.new
    assert_equal search.content, nil
  end

  test '.result_for' do
    result = Search.result_for('ahri')
    assert_equal result.has_key?(:champions), true
    assert_equal result.has_key?(:skins), true
  end
end
