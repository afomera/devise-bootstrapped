# frozen_string_literal: true

require "application_system_test_case"

class ResendUnlockInstructionsTest < ApplicationSystemTestCase
  test "can navigate to resend unlock instructions" do
    visit new_person_unlock_url
    assert_selector "h2", text: "Resend unlock instructions"
    assert_field "Email"
    assert_button "Resend unlock instructions"
    assert_link "Log in"
    assert_link "Sign up"
    assert_link "Forgot your password?"
    assert_link "Didn't receive confirmation instructions?"
  end
end
