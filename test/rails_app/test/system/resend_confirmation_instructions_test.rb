# frozen_string_literal: true

require "application_system_test_case"

class ResendConfirmationInstructionsTest < ApplicationSystemTestCase
  test "can navigate to resend confirmation instructions" do
    visit new_person_confirmation_url
    assert_selector "h2", text: "Resend confirmation instructions"
    assert_field "Email"
    assert_button "Resend confirmation instructions"
    assert_link "Log in"
    assert_link "Sign up"
    assert_link "Forgot your password?"
    assert_link "Didn't receive unlock instructions?"
  end
end
