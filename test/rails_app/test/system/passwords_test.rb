# frozen_string_literal: true

require "application_system_test_case"

class PasswordsTest < ApplicationSystemTestCase
  test "Forgot your password workflow" do
    visit new_person_password_url
    assert_selector "div.form-group", count: 2
    assert_selector "h2", text: "Forgot your password?"
    assert_field "Email"
    assert_button "Send me reset password instructions"
    assert_link "Log in"
    assert_link "Sign up"
    assert_link "Didn't receive confirmation instructions?"
    assert_link "Didn't receive unlock instructions?"

    person = people(:existing_user)
    fill_in "Email", with: person.email
    click_on "Send me reset password instructions"

    assert_selector "h2", text: "Log in"

    open_email person.email
    current_email.click_link "Change my password"

    assert_selector "div.form-group", count: 3
    assert_selector "h2", text: "Change your password"
    assert_field "New password"
    assert_field "Confirm new password"
    assert_link "Log in"
    assert_link "Sign up"
    assert_link "Didn't receive confirmation instructions?"
    assert_link "Didn't receive unlock instructions?"

    new_password = "password2"
    fill_in "New password", with: new_password
    fill_in "Confirm new password", with: new_password
    click_on "Change my password"
    assert_content "Hello, World."
    click_on "Sign Out"

    fill_in "Email", with: person.email
    fill_in "Password", with: new_password
    click_on "Log in"
    assert_content "Hello, World."
  end
end
