# frozen_string_literal: true

require_relative "test_helper"
require "capybara/email"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Capybara::Email::DSL

  # Force a specific address, and put it in the mailer config (`config/environments/test.rb`)
  # so system tests on the e-mail will work.
  Capybara.server_port = 3001
  Capybara.app_host = "http://localhost:3001"

  driven_by :selenium,
    using: :headless_chrome,
    options: { args: ["headless", "disable-gpu", "no-sandbox", "disable-dev-shm-usage"] },
    screen_size: [1400, 1400]

  def setup
    super
    # Run the generator every time, to make sure the views are up to date, but don't
    # delete them at the end of the test, so we can see what we were looking at if we
    # run a single failing test.
    Rails::Generators.invoke("devise:views", %w[-v mailer -q])
    Rails::Generators.invoke("devise:views:bootstrap_form", %w[-f -q])
  end
end
