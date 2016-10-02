require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get /search' do
    get search_index_path
    assert_response :success
  end

  test 'should post /search' do
    params = {
      search: {
        content: 'ahri'
      }
    }
    post search_index_path, { params: params }
    assert_redirected_to search_index_path(q: params[:search][:content])
  end
end
