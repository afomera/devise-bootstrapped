# frozen_string_literal: true

require "rails/generators"

module Devise
  module Views
    # Generates Devise and Devise Invitable forms using `bootstrap_form` helpers.
    class BootstrapFormGenerator < Rails::Generators::Base
      class << self
        def invitable=(value)
          @invitable = value
        end

        def invitable
          defined?(@invitable) ? @invitable : true
        end
      end

      desc "Copies views styled for Bootstrap 4 via the `bootstrap_form` gem"

      source_root File.expand_path("../../../../app/views/devise", __dir__)

      def copy_views
        %w[confirmations passwords registrations sessions shared unlocks].each do |dir|
          directory dir, "app/views/devise/#{dir}"
        end

        # FIXME: Make this figure out if `devise_invitable` is installed.
        if BootstrapFormGenerator.invitable
          %w[invitations mailer].each do |dir|
            directory dir, "app/views/devise/#{dir}"
          end
        end
      end
    end
  end
end
