require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    expect(described_class.new(email: 'hoge').email).to eq('hoge')
  end
end
