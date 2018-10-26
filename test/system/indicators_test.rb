require "application_system_test_case"

class IndicatorsTest < ApplicationSystemTestCase
  setup do
    @indicator = indicators(:one)
  end

  test "visiting the index" do
    visit indicators_url
    assert_selector "h1", text: "Indicators"
  end

  test "creating a Indicator" do
    visit indicators_url
    click_on "New Indicator"

    fill_in "Aclarar", with: @indicator.aclarar
    fill_in "Indicador", with: @indicator.indicador
    fill_in "Objective", with: @indicator.objective_id
    fill_in "Variable", with: @indicator.variable
    click_on "Create Indicator"

    assert_text "Indicator was successfully created"
    click_on "Back"
  end

  test "updating a Indicator" do
    visit indicators_url
    click_on "Edit", match: :first

    fill_in "Aclarar", with: @indicator.aclarar
    fill_in "Indicador", with: @indicator.indicador
    fill_in "Objective", with: @indicator.objective_id
    fill_in "Variable", with: @indicator.variable
    click_on "Update Indicator"

    assert_text "Indicator was successfully updated"
    click_on "Back"
  end

  test "destroying a Indicator" do
    visit indicators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Indicator was successfully destroyed"
  end
end
