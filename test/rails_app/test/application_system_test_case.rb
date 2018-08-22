# frozen_string_literal: true

require_relative "test_helper"
require "capybara/email"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Capybara::Email::DSL

  # Force a specific address, and put it in the mailer config (`config/environments/test.rb`)
  # so system tests on the e-mail will work.
  Capybara.server_port = 3001
  Capybara.app_host = "http://localhost:3001"

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  def setup
    super
    `cd test/rails_app; rails g devise:views:bootstrap_form -f`
  end
end
