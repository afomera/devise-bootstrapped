# frozen_string_literal: true

require "test_helper"

class ViewsGeneratorTest < Rails::Generators::TestCase
  tests Devise::Views::BootstrapFormGenerator
  destination File.expand_path("../../tmp", __dir__)
  setup :prepare_destination

  # When debugging generators, don't forget that `run_generator` *returns* the output
  # of the generator. So any debugging output you put in the generator won't be seen,
  # unless you explicitly `puts` (or soemthing) the return value of `run_generator`.

  test "generate views" do
    run_generator
    assert_files
    assert_no_invitable_files
  end

  test "generate views with invitable" do
    module ::DeviseInvitable; end; # rubocop:disable Style/ClassAndModuleChildren
    run_generator
    assert_files
    assert_invitable_files
  end

  # The original in Devise is here: https://github.com/plataformatec/devise/blob/3b0bc08ec67dd073ddd6d043c71646c2784ced6c/test/generators/views_generator_test.rb#L77
  def assert_files(scope = nil)
    scope = "devise" if scope.nil?

    assert_file "app/views/#{scope}/confirmations/new.html.erb"
    assert_file "app/views/#{scope}/passwords/edit.html.erb"
    assert_file "app/views/#{scope}/passwords/new.html.erb"
    assert_file "app/views/#{scope}/registrations/new.html.erb"
    assert_file "app/views/#{scope}/registrations/edit.html.erb"
    assert_file "app/views/#{scope}/sessions/new.html.erb"
    assert_file "app/views/#{scope}/shared/_links.html.erb"
    assert_file "app/views/#{scope}/unlocks/new.html.erb"
  end

  def assert_invitable_files(scope = nil)
    scope = "devise" if scope.nil?

    assert_file "app/views/#{scope}/invitations/edit.html.erb"
    assert_file "app/views/#{scope}/invitations/new.html.erb"
    assert_file "app/views/#{scope}/mailer/invitation_instructions.html.erb"
    assert_file "app/views/#{scope}/mailer/invitation_instructions.text.erb"
  end

  def assert_no_invitable_files(scope = nil)
    scope = "devise" if scope.nil?

    assert_no_file "app/views/#{scope}/invitations/edit.html.erb"
    assert_no_file "app/views/#{scope}/invitations/new.html.erb"
    assert_no_file "app/views/#{scope}/mailer/invitation_instructions.html.erb"
    assert_no_file "app/views/#{scope}/mailer/invitation_instructions.text.erb"
  end
end
