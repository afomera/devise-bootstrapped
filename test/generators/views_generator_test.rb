# frozen_string_literal: true

require "test_helper"

class ViewsGeneratorTest < Test
  # When debugging generators, don't forget that `run_generator` *returns* the output
  # of the generator. So any debugging output you put in the generator won't be seen,
  # unless you explicitly `puts` (or something) the return value of `run_generator`.

  test "generate views" do
    Object.send(:remove_const, :DeviseInvitable) if (Object.const_get(:DeviseInvitable).is_a?(Module) rescue false) # rubocop:disable Style/RescueModifier
    Object.send(:remove_const, :DeviseI18n) if (Object.const_get(:DeviseI18n).is_a?(Module) rescue false) # rubocop:disable Style/RescueModifier
    run_generator
    assert_files
    assert_no_invitable_files
  end

  test "generate views with invitable" do
    Object.send(:remove_const, :DeviseI18n) if (Object.const_get(:DeviseI18n).is_a?(Module) rescue false) # rubocop:disable Style/RescueModifier
    module ::DeviseInvitable; end; # rubocop:disable Style/ClassAndModuleChildren
    run_generator
    assert_files
    assert_invitable_files
  end

  test "generate views with i18n" do
    Object.send(:remove_const, :DeviseInvitable) if (Object.const_get(:DeviseInvitable).is_a?(Module) rescue false) # rubocop:disable Style/RescueModifier
    module ::DeviseI18n; end; # rubocop:disable Style/ClassAndModuleChildren
    run_generator
    assert_i18n_files
    assert_no_invitable_files
  end

  # The original in Devise is here: https://github.com/plataformatec/devise/blob/3b0bc08ec67dd073ddd6d043c71646c2784ced6c/test/generators/views_generator_test.rb#L77
  def assert_files(scope = nil)
    scope = "devise" if scope.nil?

    assert_file "app/views/#{scope}/confirmations/new.html.erb" do |content|
      assert_match(/Resend confirmation instructions/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/passwords/edit.html.erb" do |content|
      assert_match(/Change your password/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/passwords/new.html.erb" do |content|
      assert_match(/Forgot your password\?/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/registrations/edit.html.erb" do |content|
      assert_match(/Edit <%= resource_name.to_s.humanize %>/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/registrations/new.html.erb" do |content|
      assert_match(/Sign up/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/sessions/new.html.erb" do |content|
      assert_match(/Log in/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/shared/_links.html.erb" do |content|
      assert_match(/Sign up/, content)
      assert_match(/Log in/, content)
      assert_match(/Forgot your password\?/, content)
      assert_match(/Didn't receive confirmation instructions\?/, content)
      assert_match(/Didn't receive unlock instructions\?/, content)
    end
    assert_file "app/views/#{scope}/shared/_error_messages.html.erb" do |content|
      assert_match(/resource: resource\.class\.model_name\.human\.downcase/, content)
    end
    assert_file "app/views/#{scope}/unlocks/new.html.erb" do |content|
      assert_match(/Resend unlock instructions/, content)
      assert_match "bootstrap_form_for", content
    end
  end

  def assert_i18n_files(scope = nil)
    scope = "devise" if scope.nil?

    assert_file "app/views/#{scope}/confirmations/new.html.erb" do |content|
      assert_match(/t\('.resend_confirmation_instructions'\)/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/passwords/edit.html.erb" do |content|
      assert_match(/t\('.change_your_password'\)/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/passwords/new.html.erb" do |content|
      assert_match(/t\('.forgot_your_password'\)/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/registrations/new.html.erb" do |content|
      assert_match(/t\('.sign_up'\)/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/registrations/edit.html.erb" do |content|
      assert_match(/t\('.title', /, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/sessions/new.html.erb" do |content|
      assert_match(/t\('.sign_in'\)/, content)
      assert_match "bootstrap_form_for", content
    end
    assert_file "app/views/#{scope}/shared/_links.html.erb" do |content|
      assert_match(/t\(".sign_up"\)/, content)
      assert_match(/t\(".sign_in"\)/, content)
      assert_match(/t\(".forgot_your_password"\)/, content)
      assert_match(/t\('.didn_t_receive_confirmation_instructions'\)/, content)
      assert_match(/t\('.didn_t_receive_unlock_instructions'\)/, content)
    end
    assert_file "app/views/#{scope}/shared/_error_messages.html.erb" do |content|
      assert_match(/resource: resource\.class\.model_name\.human\.downcase/, content)
    end
    assert_file "app/views/#{scope}/unlocks/new.html.erb" do |content|
      assert_match(/t\('.resend_unlock_instructions'\)/, content)
      assert_match "bootstrap_form_for", content
    end
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
