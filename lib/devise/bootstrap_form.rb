# frozen_string_literal: true

require "rails/railtie"
require "rails/engine/railties"
require "devise/bootstrap_form/version"
require "generators/devise/views/bootstrap_form_generator"

module Devise
  module BootstrapForm
    class Engine < ::Rails::Engine
    end
  end
end
