require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "should create project" do
    visit projects_url
    click_on "New project"

    fill_in "App domain", with: @project.app_domain
    fill_in "Call", with: @project.call
    fill_in "Client", with: @project.client
    fill_in "Code repos", with: @project.code_repos
    fill_in "Data sources", with: @project.data_sources
    fill_in "Deliverables", with: @project.deliverables
    fill_in "Duration", with: @project.duration
    fill_in "End date", with: @project.end_date
    fill_in "Eurecat budget", with: @project.eurecat_budget
    fill_in "Eurecat budget excel", with: @project.eurecat_budget_excel
    fill_in "Keywords", with: @project.keywords
    fill_in "People involved", with: @project.people_involved
    fill_in "Presentation", with: @project.presentation
    fill_in "Start date", with: @project.start_date
    fill_in "Title", with: @project.title
    fill_in "Total budget", with: @project.total_budget
    fill_in "Type", with: @project.type
    fill_in "Units involved", with: @project.units_involved
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "should update Project" do
    visit project_url(@project)
    click_on "Edit this project", match: :first

    fill_in "App domain", with: @project.app_domain
    fill_in "Call", with: @project.call
    fill_in "Client", with: @project.client
    fill_in "Code repos", with: @project.code_repos
    fill_in "Data sources", with: @project.data_sources
    fill_in "Deliverables", with: @project.deliverables
    fill_in "Duration", with: @project.duration
    fill_in "End date", with: @project.end_date
    fill_in "Eurecat budget", with: @project.eurecat_budget
    fill_in "Eurecat budget excel", with: @project.eurecat_budget_excel
    fill_in "Keywords", with: @project.keywords
    fill_in "People involved", with: @project.people_involved
    fill_in "Presentation", with: @project.presentation
    fill_in "Start date", with: @project.start_date
    fill_in "Title", with: @project.title
    fill_in "Total budget", with: @project.total_budget
    fill_in "Type", with: @project.type
    fill_in "Units involved", with: @project.units_involved
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "should destroy Project" do
    visit project_url(@project)
    click_on "Destroy this project", match: :first

    assert_text "Project was successfully destroyed"
  end
end
