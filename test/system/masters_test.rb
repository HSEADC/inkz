require "application_system_test_case"

class MastersTest < ApplicationSystemTestCase
  setup do
    @master = masters(:one)
  end

  test "visiting the index" do
    visit masters_url
    assert_selector "h1", text: "Masters"
  end

  test "should create master" do
    visit masters_url
    click_on "New master"

    fill_in "Name", with: @master.name
    fill_in "Nickname", with: @master.nickname
    fill_in "Specialization", with: @master.specialization
    click_on "Create Master"

    assert_text "Master was successfully created"
    click_on "Back"
  end

  test "should update Master" do
    visit master_url(@master)
    click_on "Edit this master", match: :first

    fill_in "Name", with: @master.name
    fill_in "Nickname", with: @master.nickname
    fill_in "Specialization", with: @master.specialization
    click_on "Update Master"

    assert_text "Master was successfully updated"
    click_on "Back"
  end

  test "should destroy Master" do
    visit master_url(@master)
    click_on "Destroy this master", match: :first

    assert_text "Master was successfully destroyed"
  end
end
