require "application_system_test_case"

class CsvFilesTest < ApplicationSystemTestCase
  setup do
    @csv_file = csv_files(:one)
  end

  test "visiting the index" do
    visit csv_files_url
    assert_selector "h1", text: "Csv files"
  end

  test "should create csv file" do
    visit csv_files_url
    click_on "New csv file"

    fill_in "Copy destination fields", with: @csv_file.copy_destination_fields
    fill_in "Copy source fields", with: @csv_file.copy_source_fields
    fill_in "Fields to sanitize", with: @csv_file.fields_to_sanitize
    fill_in "Tags to keep", with: @csv_file.tags_to_keep
    click_on "Create Csv file"

    assert_text "Csv file was successfully created"
    click_on "Back"
  end

  test "should update Csv file" do
    visit csv_file_url(@csv_file)
    click_on "Edit this csv file", match: :first

    fill_in "Copy destination fields", with: @csv_file.copy_destination_fields
    fill_in "Copy source fields", with: @csv_file.copy_source_fields
    fill_in "Fields to sanitize", with: @csv_file.fields_to_sanitize
    fill_in "Tags to keep", with: @csv_file.tags_to_keep
    click_on "Update Csv file"

    assert_text "Csv file was successfully updated"
    click_on "Back"
  end

  test "should destroy Csv file" do
    visit csv_file_url(@csv_file)
    click_on "Destroy this csv file", match: :first

    assert_text "Csv file was successfully destroyed"
  end
end
