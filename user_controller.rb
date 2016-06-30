class UserController < ActionController::Base

  def update
    user = User.find(params[:id])
    updater = current_user.updater_for(user)
    updater.update_attributes(params[:user])
    if user.errors.any?
      #
    else
    end
  end

end
