require 'spec_helper'
require_relative '../user'
describe ProtectionProxy do

  let(:user) { User.new("Tom", "tom@waits.com", "Rookie") }
  let(:proxy) { UserAsBookStoreOwner.new(user) }

  it 'assigns attributes properly' do
    expect(proxy.name).to eq "Tom"
  end

  context 'when accesing writable attributes' do
    it 'can change writable attributes' do
      proxy.membership_level = "Advanced"
      expect(proxy.membership_level).to eq "Advanced"
    end

    it 'can not change protected attributes' do
      proxy.name = "Joe"
      expect(proxy.name).to eq "Tom"
    end

    it 'can access a normally defined method' do
      expect(proxy.class).to eq User
    end
  end

 
end
