class SearchController < ApplicationController
  def index
    @search = Search.new
    @query = params[:q]
    @search_result = []
    @search_result = Search.result_for(@query) if @query
  end

  def create
    redirect_to search_index_path(q: search_params[:content])
  end

  private
    def search_params
      params.require(:search).permit(:content)
    end
end
