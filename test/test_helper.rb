# frozen_string_literal: true

require "minitest/autorun"

ENV["RAILS_ENV"] ||= "test"

require "devise_bootstrap_form"

class Test < Rails::Generators::TestCase
  tests Devise::Views::BootstrapFormGenerator
  destination File.expand_path("/tmp", __dir__)

  setup :prepare_destination

  # AssertGeneratorTest, this makes the test work.
  # For others, it silences a warning message that might be confusing to developers.
  setup do
    FileUtils.mkdir_p("/tmp/app/assets/stylesheets")
    FileUtils.touch("/tmp/app/assets/stylesheets/application.scss")
  end
end
