# frozen_string_literal: true

require "application_system_test_case"

class SignInTest < ApplicationSystemTestCase
  test "can navigate to sign in" do
    visit new_person_session_url
    assert_selector "div.form-group", count: 4
    assert_selector "h2", text: "Log in"
    assert_field "Email"
    assert_field "Password"
    assert_unchecked_field "Remember me"
    assert_button "Log in"
    assert_link "Sign up"
    assert_link "Forgot your password?"
    assert_link "Didn't receive confirmation instructions?"
    assert_link "Didn't receive unlock instructions?"
  end

  test "go to sign in when signed out" do
    visit root_path
    assert_selector "h2", text: "Log in"
  end
end
