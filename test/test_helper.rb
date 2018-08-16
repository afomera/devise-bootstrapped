# frozen_string_literal: true

require "minitest/autorun"
require "action_view"

class Test < ActionView::TestCase
  class User
    attr_reader :email, :name, :password

    def initialize
      @email = "email@example.com"
      @name = "name"
      @password = "password"
    end
  end

  setup do
    @view_root = File.join("app", "views", "devise")
  end
end
