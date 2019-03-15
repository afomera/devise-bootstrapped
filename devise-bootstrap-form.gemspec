# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "devise_bootstrap_form/version"

Gem::Specification.new do |spec|
  spec.name          = "devise-bootstrap-form"
  spec.version       = DeviseBootstrapForm::VERSION
  spec.authors       = ["Larry Reid"]
  spec.email         = ["larry.reid@jadesystems.ca"]

  spec.summary       = "Generates nicer views for Devise that use Bootstrap via the `bootstrap_form` gem."
  spec.description   = <<-DESC
This gem generates Devise views styled with Bootstrap via the `bootstrap_form`
gem. If you plan to use, or are using, `bootstrap_form` in your app, your Devise
forms will be consistent with the rest of your forms.

The generator will detect if you're using `devise_invitable`, and will generate
`bootstrap_form` forms for its views as well. If you're using `devise-i18n`, the
forms will use translations.
  DESC
  spec.homepage      = "https://github.com/lcreid/devise-bootstrap-form"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata) # rubocop:disable Style/GuardClause
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bootstrap_form", ">= 4.0.0.alpha1"
  spec.add_dependency "devise"
  spec.add_dependency "rails", ">= 5.0.0"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "chandler"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
end
