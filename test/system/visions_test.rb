require "application_system_test_case"

class VisionsTest < ApplicationSystemTestCase
  setup do
    @vision = visions(:one)
  end

  test "visiting the index" do
    visit visions_url
    assert_selector "h1", text: "Visions"
  end

  test "creating a Vision" do
    visit visions_url
    click_on "New Vision"

    fill_in "Title", with: @vision.title
    click_on "Create Vision"

    assert_text "Vision was successfully created"
    click_on "Back"
  end

  test "updating a Vision" do
    visit visions_url
    click_on "Edit", match: :first

    fill_in "Title", with: @vision.title
    click_on "Update Vision"

    assert_text "Vision was successfully updated"
    click_on "Back"
  end

  test "destroying a Vision" do
    visit visions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vision was successfully destroyed"
  end
end
