require 'rails/generators'

module Devise
  module Views
    class BootstrappedGenerator < Rails::Generators::Base
      desc "Copies views styled for Bootstrap 3"

      source_root File.expand_path("../../../..", __FILE__)

      def copy_views
        directory "app/views/devise", "app/views/devise"
      end
    end
  end
end
