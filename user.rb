require './protection_proxy'
class User
  attr_accessor :name, :email, :membership_level

  def initialize(name, email, membership_level)
    @name = name
    @email = email
    @membership_level = membership_level
  end
end

class UserAsBookStoreOwner < ProtectionProxy
  writable :membership_level

end
