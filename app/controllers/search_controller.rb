class SearchController < ApplicationController
  def search
    @query = params[:query]
    @articles = Article.where("title LIKE ? OR body LIKE ?", "%#{@query}%", "%#{@query}%")
    @projects = Project.where("title LIKE ?", "%#{@query}")
    @proposals = Proposal.where("title LIKE ?", "%#{@query}")
    @tools = Tool.where("title LIKE ?", "%#{@query}")
    render :search_results
  end
end
