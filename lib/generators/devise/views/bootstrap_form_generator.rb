# frozen_string_literal: true

require "rails/generators"

module Devise
  module Views
    # Generates Devise and Devise Invitable forms using `bootstrap_form` helpers.
    class BootstrapFormGenerator < Rails::Generators::Base
      class << self
        def invitable
          Object.const_get(:DeviseInvitable).is_a?(Module) rescue false # rubocop:disable Style/RescueModifier
        end

        def i18n
          Object.const_get(:DeviseI18n).is_a?(Module) rescue false # rubocop:disable Style/RescueModifier
        end
      end

      desc "Copies views styled for Bootstrap 4 via the `bootstrap_form` gem"

      source_root File.expand_path("../../../../app", __dir__)

      def copy_views
        copy_base_devise(BootstrapFormGenerator.i18n ? "i18n" : "devise")
        # The shared error message view is already internationalized.
        copy_file "views/devise/shared/_error_messages.html.erb",
          "app/views/devise/shared/_error_messages.html.erb"
        copy_invitable_devise
      end

      def copy_assets
        directory "assets/stylesheets", "app/assets/stylesheets"
        append_to_file "app/assets/stylesheets/application.scss" do
          '@import "devise_bootstrap_form";'
        end
      end

      private

      def copy_base_devise(source)
        %w[confirmations passwords registrations sessions shared unlocks].each do |dir|
          directory File.join("views/#{source}", dir),
            "app/views/devise/#{dir}"
        end
      end

      def copy_invitable_devise
        if BootstrapFormGenerator.invitable # rubocop:disable Style/GuardClause
          %w[invitations mailer].each do |dir|
            directory File.join("views/devise", dir), "app/views/devise/#{dir}"
          end
        end
      end
    end
  end
end
