# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "test/rails_app/test"
  t.pattern = "test/**/*_test.rb"
  t.verbose = false
end

task default: :test
