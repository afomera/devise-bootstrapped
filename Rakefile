# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require 'rubocop/rake_task'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.verbose = false
end

desc "Run RuboCop lint checks"
RuboCop::RakeTask.new(:lint) do |task|
  task.options = ["--lint"]
end

task default: %i[test lint]
