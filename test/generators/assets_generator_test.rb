# frozen_string_literal: true

require "test_helper"

class AssetsGeneratorTest < Test
  # When debugging generators, don't forget that `run_generator` *returns* the output
  # of the generator. So any debugging output you put in the generator won't be seen,
  # unless you explicitly `puts` (or something) the return value of `run_generator`.

  test "generate assets" do
    run_generator
    assert_file "app/assets/stylesheets/devise_bootstrap_form.scss"
    assert_file "app/assets/stylesheets/application.scss", /^@import "devise_bootstrap_form";$/
  end
end
