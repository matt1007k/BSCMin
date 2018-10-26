require "application_system_test_case"

class DatosTest < ApplicationSystemTestCase
  setup do
    @dato = datos(:one)
  end

  test "visiting the index" do
    visit datos_url
    assert_selector "h1", text: "Datos"
  end

  test "creating a Dato" do
    visit datos_url
    click_on "New Dato"

    fill_in "Abril", with: @dato.abril
    fill_in "Agosto", with: @dato.agosto
    fill_in "Anio", with: @dato.anio
    fill_in "Diciembre", with: @dato.diciembre
    fill_in "Enero", with: @dato.enero
    fill_in "Febrero", with: @dato.febrero
    fill_in "Indicator", with: @dato.indicator_id
    fill_in "Julio", with: @dato.julio
    fill_in "Junio", with: @dato.junio
    fill_in "Marzo", with: @dato.marzo
    fill_in "Mayo", with: @dato.mayo
    fill_in "Noviembre", with: @dato.noviembre
    fill_in "Octubre", with: @dato.octubre
    fill_in "Porcetaje", with: @dato.porcetaje
    fill_in "Septiembre", with: @dato.septiembre
    fill_in "Total", with: @dato.total
    click_on "Create Dato"

    assert_text "Dato was successfully created"
    click_on "Back"
  end

  test "updating a Dato" do
    visit datos_url
    click_on "Edit", match: :first

    fill_in "Abril", with: @dato.abril
    fill_in "Agosto", with: @dato.agosto
    fill_in "Anio", with: @dato.anio
    fill_in "Diciembre", with: @dato.diciembre
    fill_in "Enero", with: @dato.enero
    fill_in "Febrero", with: @dato.febrero
    fill_in "Indicator", with: @dato.indicator_id
    fill_in "Julio", with: @dato.julio
    fill_in "Junio", with: @dato.junio
    fill_in "Marzo", with: @dato.marzo
    fill_in "Mayo", with: @dato.mayo
    fill_in "Noviembre", with: @dato.noviembre
    fill_in "Octubre", with: @dato.octubre
    fill_in "Porcetaje", with: @dato.porcetaje
    fill_in "Septiembre", with: @dato.septiembre
    fill_in "Total", with: @dato.total
    click_on "Update Dato"

    assert_text "Dato was successfully updated"
    click_on "Back"
  end

  test "destroying a Dato" do
    visit datos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dato was successfully destroyed"
  end
end
