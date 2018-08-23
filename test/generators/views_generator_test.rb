# frozen_string_literal: true

require "test_helper"

class ViewsGeneratorTest < Rails::Generators::TestCase
  tests Devise::Views::BootstrapFormGenerator
  destination File.expand_path("../../tmp", __dir__)
  setup :prepare_destination

  test "generate views" do
    run_generator
    assert_files
  end

  def assert_files(scope = nil, options={})
    scope = "devise" if scope.nil?
    # mail_template_engine = options[:mail_template_engine] || "html.erb"

    assert_file "app/views/#{scope}/confirmations/new.html.erb"
    # assert_file "app/views/#{scope}/mailer/confirmation_instructions.#{mail_template_engine}"
    # assert_file "app/views/#{scope}/mailer/reset_password_instructions.#{mail_template_engine}"
    # assert_file "app/views/#{scope}/mailer/unlock_instructions.#{mail_template_engine}"
    assert_file "app/views/#{scope}/passwords/edit.html.erb"
    assert_file "app/views/#{scope}/passwords/new.html.erb"
    assert_file "app/views/#{scope}/registrations/new.html.erb"
    assert_file "app/views/#{scope}/registrations/edit.html.erb"
    assert_file "app/views/#{scope}/sessions/new.html.erb"
    assert_file "app/views/#{scope}/shared/_links.html.erb"
    assert_file "app/views/#{scope}/unlocks/new.html.erb"
  end
end
