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
      end

      desc "Copies views styled for Bootstrap 4 via the `bootstrap_form` gem"

      source_root File.expand_path("../../../../app", __dir__)

      def copy_views
        %w[confirmations passwords registrations sessions shared unlocks].each do |dir|
          directory File.join("views/devise", dir), "app/views/devise/#{dir}"
        end

        if BootstrapFormGenerator.invitable
          %w[invitations mailer].each do |dir|
            directory File.join("views/devise", dir), "app/views/devise/#{dir}"
          end
        end
      end

      def copy_assets
        directory "assets/stylesheets", "app/assets/stylesheets"
        # puts "copy_assets: #{File.read "/tmp/app/assets/stylesheets/application.scss"}"
        append_to_file "app/assets/stylesheets/application.scss" do
          '@import "devise_bootstrap_form";'
        end
      end
    end
  end
end
