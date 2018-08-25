# frozen_string_literal: true

require "rails/generators"

module Devise
  module Views
    class BootstrapFormGenerator < Rails::Generators::Base
      class << self
        attr_accessor :invitable
      end

      desc "Copies views styled for Bootstrap 4 via the `bootstrap_form` gem"

      source_root File.expand_path("../../../../app/views/devise", __dir__)

      def copy_views
        %w[confirmations passwords registrations sessions shared unlocks].each do |dir|
          directory dir, "app/views/devise/#{dir}"
        end

        # if BootstrapFormGenerator.invitable
          %w[invitations mailer].each do |dir|
            directory dir, "app/views/devise/#{dir}"
          end
        # end
      end
    end
  end
end
