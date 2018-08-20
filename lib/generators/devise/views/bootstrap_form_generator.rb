# frozen_string_literal: true

require "rails/generators"

module Devise
  module Views
    class BootstrapFormGenerator < Rails::Generators::Base
      desc "Copies views styled for Bootstrap 4 via the `bootstrap_form` gem"

      source_root File.expand_path("../../../../app/views/devise", __dir__)

      def copy_views
        directory "", "app/views/devise"
      end
    end
  end
end
