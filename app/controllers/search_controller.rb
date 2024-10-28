class SearchController < ApplicationController
  def search
    @query = params[:query]
    @articles = Article.where(
      "title LIKE ? OR body LIKE ?",
      "%#{@query}%", "%#{@query}%")
    @projects = Project.where(
      "title LIKE ? OR tipus LIKE ? OR call LIKE ? OR app_domain LIKE ? OR client LIKE ? OR keywords LIKE ?",
      "%#{@query}%","%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%"
    )
    @proposals = Proposal.where(
      "title LIKE ? OR tipus LIKE ? OR call LIKE ? OR app_domain LIKE ? OR keywords LIKE ?",
      "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%"
    )
    @tools = Tool.where(
      "title LIKE ? OR tipus LIKE ? OR keywords LIKE ?",
      "%#{@query}%", "%#{@query}%", "%#{@query}%"
    )
    render :search_results
  end
end
