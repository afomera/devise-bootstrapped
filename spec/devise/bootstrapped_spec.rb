require 'spec_helper'

describe Devise::Bootstrapped do
  it 'has a version number' do
    expect(Devise::Bootstrapped::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
