require "application_system_test_case"

class TattoosTest < ApplicationSystemTestCase
  setup do
    @tattoo = tattoos(:one)
  end

  test "visiting the index" do
    visit tattoos_url
    assert_selector "h1", text: "Tattoos"
  end

  test "should create tattoo" do
    visit tattoos_url
    click_on "New tattoo"

    fill_in "Master", with: @tattoo.master_id
    fill_in "Title", with: @tattoo.title
    click_on "Create Tattoo"

    assert_text "Tattoo was successfully created"
    click_on "Back"
  end

  test "should update Tattoo" do
    visit tattoo_url(@tattoo)
    click_on "Edit this tattoo", match: :first

    fill_in "Master", with: @tattoo.master_id
    fill_in "Title", with: @tattoo.title
    click_on "Update Tattoo"

    assert_text "Tattoo was successfully updated"
    click_on "Back"
  end

  test "should destroy Tattoo" do
    visit tattoo_url(@tattoo)
    click_on "Destroy this tattoo", match: :first

    assert_text "Tattoo was successfully destroyed"
  end
end
