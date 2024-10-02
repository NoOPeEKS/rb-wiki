require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count") do
      post projects_url, params: { project: { app_domain: @project.app_domain, call: @project.call, client: @project.client, code_repos: @project.code_repos, data_sources: @project.data_sources, deliverables: @project.deliverables, duration: @project.duration, end_date: @project.end_date, eurecat_budget: @project.eurecat_budget, eurecat_budget_excel: @project.eurecat_budget_excel, keywords: @project.keywords, people_involved: @project.people_involved, presentation: @project.presentation, start_date: @project.start_date, title: @project.title, total_budget: @project.total_budget, type: @project.type, units_involved: @project.units_involved } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { app_domain: @project.app_domain, call: @project.call, client: @project.client, code_repos: @project.code_repos, data_sources: @project.data_sources, deliverables: @project.deliverables, duration: @project.duration, end_date: @project.end_date, eurecat_budget: @project.eurecat_budget, eurecat_budget_excel: @project.eurecat_budget_excel, keywords: @project.keywords, people_involved: @project.people_involved, presentation: @project.presentation, start_date: @project.start_date, title: @project.title, total_budget: @project.total_budget, type: @project.type, units_involved: @project.units_involved } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
