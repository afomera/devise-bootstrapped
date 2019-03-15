# frozen_string_literal: true

require "minitest/autorun"

ENV["RAILS_ENV"] ||= "test"

require "devise_bootstrap_form"

class Test < Rails::Generators::TestCase
  tests Devise::Views::BootstrapFormGenerator
  destination File.expand_path("../tmp", __dir__)

  # For AssertGeneratorTest, this makes the test work.
  # For others, it silences a warning message that might be confusing to developers.
  setup do
    prepare_destination
    FileUtils.mkdir_p(File.join(destination_root, "app/assets/stylesheets"))
    FileUtils.touch(File.join(destination_root, "app/assets/stylesheets/application.scss"))
  end
end
