class User < ActiveRecord::Base

  def updater_for(obj)
    find_updator(user_role, obj.class)
  end

  def find_updator(role, klass)

  end

end
