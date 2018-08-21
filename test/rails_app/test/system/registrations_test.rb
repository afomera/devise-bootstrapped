# frozen_string_literal: true

require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  test "Sign up workflow" do
    visit new_person_registration_url
    assert_selector "h2", text: "Sign up"
    assert_field "Email"
    assert_field "Password"
    assert_field "Password confirmation"
    assert_button "Sign up"
    assert_link "Log in"
    assert_link "Didn't receive confirmation instructions?"
    assert_link "Didn't receive unlock instructions?"
  end

  test "can confirm account" do
    password = "password"

    visit new_person_registration_url
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "Sign up"

    # Wait for a bit to make sure the e-mail is sent.
    assert_selector "h2", text: "Log in"

    open_email "example@example.com"
    # puts current_email.body
    current_email.click_link "Confirm my account"
    # take_screenshot

    assert_selector "h2", text: "Log in"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: password
    click_on "Log in"
    assert_content "Hello, World."
  end

  test "can edit person" do
    visit new_person_session_url
    person = people(:existing_user)
    fill_in "Email", with: person.email
    fill_in "Password", with: "password"
    click_on "Log in"
    assert_content "Hello, World."

    visit edit_person_registration_url
    assert_selector "h2", text: "Edit Person"
    assert_field "Email"
    assert_field "Password"
    assert_field "Password confirmation"
    assert_field "Current password"
    assert_button "Update"
    assert_button "Cancel my account"
    assert_link "Back"
  end
end
