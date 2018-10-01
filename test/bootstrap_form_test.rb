# frozen_string_literal: true

require "test_helper"

class BootstrapFormTest < ActiveSupport::TestCase
  test "has a version number" do
    refute_nil DeviseBootstrapForm::VERSION
  end
end
