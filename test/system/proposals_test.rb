require "application_system_test_case"

class ProposalsTest < ApplicationSystemTestCase
  setup do
    @proposal = proposals(:one)
  end

  test "visiting the index" do
    visit proposals_url
    assert_selector "h1", text: "Proposals"
  end

  test "should create proposal" do
    visit proposals_url
    click_on "New proposal"

    fill_in "App domain", with: @proposal.app_domain
    fill_in "Call", with: @proposal.call
    fill_in "Client", with: @proposal.client
    fill_in "Deadline", with: @proposal.deadline
    fill_in "Document link", with: @proposal.document_link
    fill_in "Duration", with: @proposal.duration
    fill_in "Eurecat budget", with: @proposal.eurecat_budget
    fill_in "Eurecat budget excel", with: @proposal.eurecat_budget_excel
    fill_in "Keywords", with: @proposal.keywords
    fill_in "People involved", with: @proposal.people_involved
    fill_in "Status", with: @proposal.status
    fill_in "Title", with: @proposal.title
    fill_in "Total budget", with: @proposal.total_budget
    fill_in "Type", with: @proposal.type
    fill_in "Units involved", with: @proposal.units_involved
    click_on "Create Proposal"

    assert_text "Proposal was successfully created"
    click_on "Back"
  end

  test "should update Proposal" do
    visit proposal_url(@proposal)
    click_on "Edit this proposal", match: :first

    fill_in "App domain", with: @proposal.app_domain
    fill_in "Call", with: @proposal.call
    fill_in "Client", with: @proposal.client
    fill_in "Deadline", with: @proposal.deadline
    fill_in "Document link", with: @proposal.document_link
    fill_in "Duration", with: @proposal.duration
    fill_in "Eurecat budget", with: @proposal.eurecat_budget
    fill_in "Eurecat budget excel", with: @proposal.eurecat_budget_excel
    fill_in "Keywords", with: @proposal.keywords
    fill_in "People involved", with: @proposal.people_involved
    fill_in "Status", with: @proposal.status
    fill_in "Title", with: @proposal.title
    fill_in "Total budget", with: @proposal.total_budget
    fill_in "Type", with: @proposal.type
    fill_in "Units involved", with: @proposal.units_involved
    click_on "Update Proposal"

    assert_text "Proposal was successfully updated"
    click_on "Back"
  end

  test "should destroy Proposal" do
    visit proposal_url(@proposal)
    click_on "Destroy this proposal", match: :first

    assert_text "Proposal was successfully destroyed"
  end
end
