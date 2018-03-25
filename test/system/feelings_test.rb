require "application_system_test_case"

class FeelingsTest < ApplicationSystemTestCase
  setup do
    @feeling = feelings(:one)
  end

  test "visiting the index" do
    visit feelings_url
    assert_selector "h1", text: "Feelings"
  end

  test "creating a Feeling" do
    visit feelings_url
    click_on "New Feeling"

    fill_in "Content", with: @feeling.content
    fill_in "Ip", with: @feeling.ip
    fill_in "User Agent", with: @feeling.user_agent
    click_on "Create Feeling"

    assert_text "Feeling was successfully created"
    click_on "Back"
  end

  test "updating a Feeling" do
    visit feelings_url
    click_on "Edit", match: :first

    fill_in "Content", with: @feeling.content
    fill_in "Ip", with: @feeling.ip
    fill_in "User Agent", with: @feeling.user_agent
    click_on "Update Feeling"

    assert_text "Feeling was successfully updated"
    click_on "Back"
  end

  test "destroying a Feeling" do
    visit feelings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Feeling was successfully destroyed"
  end
end
