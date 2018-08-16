require "rails/railtie"
require "rails/engine/railties"
require "devise/bootstrap-form/version"
require "devise/generators/bootstrap_form_generator"

module Devise
  module BootstrapForm
    class Engine < ::Rails::Engine
    end
  end
end
