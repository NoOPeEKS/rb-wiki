require "application_system_test_case"

class ToolsTest < ApplicationSystemTestCase
  setup do
    @tool = tools(:one)
  end

  test "visiting the index" do
    visit tools_url
    assert_selector "h1", text: "Tools"
  end

  test "should create tool" do
    visit tools_url
    click_on "New tool"

    fill_in "Code repo link", with: @tool.code_repo_link
    fill_in "Date", with: @tool.date
    fill_in "Document link", with: @tool.document_link
    fill_in "Keywords", with: @tool.keywords
    fill_in "Technology", with: @tool.technology
    fill_in "Title", with: @tool.title
    fill_in "Type", with: @tool.type
    fill_in "Units", with: @tool.units
    click_on "Create Tool"

    assert_text "Tool was successfully created"
    click_on "Back"
  end

  test "should update Tool" do
    visit tool_url(@tool)
    click_on "Edit this tool", match: :first

    fill_in "Code repo link", with: @tool.code_repo_link
    fill_in "Date", with: @tool.date
    fill_in "Document link", with: @tool.document_link
    fill_in "Keywords", with: @tool.keywords
    fill_in "Technology", with: @tool.technology
    fill_in "Title", with: @tool.title
    fill_in "Type", with: @tool.type
    fill_in "Units", with: @tool.units
    click_on "Update Tool"

    assert_text "Tool was successfully updated"
    click_on "Back"
  end

  test "should destroy Tool" do
    visit tool_url(@tool)
    click_on "Destroy this tool", match: :first

    assert_text "Tool was successfully destroyed"
  end
end
