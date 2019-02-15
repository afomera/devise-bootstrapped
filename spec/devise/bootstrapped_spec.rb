require 'spec_helper'
require 'rails/generators'

describe Devise::Bootstrapped do
  it 'has a version number' do
    expect(Devise::Bootstrapped::VERSION).not_to be nil
  end
end
