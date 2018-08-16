# frozen_string_literal: true

require "test_helper"

class BootstrapFormTest < MiniTest::Test
  def test_has_a_version_number
    refute_nil Devise::BootstrapForm::VERSION
  end
end
