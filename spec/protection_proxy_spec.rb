require 'spec_helper'
describe ProtectionProxy do

  class User
    attr_accessor :name, :email, :membership_level

    def initialize(name, email, membership_level)
      @name = name
      @email = email
      @membership_level = membership_level
    end
  end

  class ProtectedUser < ProtectionProxy
    role :owner do
      writable :membership_level
    end

    role :browser do
      writable :name, :email
    end

  end

  let(:user) { User.new("Tom", "tom@waits.com", "Rookie") }
  let(:proxy) { ProtectedUser.find_proxy(user, :owner) }

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
  end
 
end
