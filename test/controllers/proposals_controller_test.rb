require "test_helper"

class ProposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal = proposals(:one)
  end

  test "should get index" do
    get proposals_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_url
    assert_response :success
  end

  test "should create proposal" do
    assert_difference("Proposal.count") do
      post proposals_url, params: { proposal: { app_domain: @proposal.app_domain, call: @proposal.call, client: @proposal.client, deadline: @proposal.deadline, document_link: @proposal.document_link, duration: @proposal.duration, eurecat_budget: @proposal.eurecat_budget, eurecat_budget_excel: @proposal.eurecat_budget_excel, keywords: @proposal.keywords, people_involved: @proposal.people_involved, status: @proposal.status, title: @proposal.title, total_budget: @proposal.total_budget, type: @proposal.type, units_involved: @proposal.units_involved } }
    end

    assert_redirected_to proposal_url(Proposal.last)
  end

  test "should show proposal" do
    get proposal_url(@proposal)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_url(@proposal)
    assert_response :success
  end

  test "should update proposal" do
    patch proposal_url(@proposal), params: { proposal: { app_domain: @proposal.app_domain, call: @proposal.call, client: @proposal.client, deadline: @proposal.deadline, document_link: @proposal.document_link, duration: @proposal.duration, eurecat_budget: @proposal.eurecat_budget, eurecat_budget_excel: @proposal.eurecat_budget_excel, keywords: @proposal.keywords, people_involved: @proposal.people_involved, status: @proposal.status, title: @proposal.title, total_budget: @proposal.total_budget, type: @proposal.type, units_involved: @proposal.units_involved } }
    assert_redirected_to proposal_url(@proposal)
  end

  test "should destroy proposal" do
    assert_difference("Proposal.count", -1) do
      delete proposal_url(@proposal)
    end

    assert_redirected_to proposals_url
  end
end
