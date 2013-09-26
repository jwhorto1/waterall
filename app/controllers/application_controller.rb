class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource_or_scope)
    
    if !(current_user.person.first_name && current_user.person.last_name)
      flash[:notice] = t("devise.custom.signed_sucessfully")
      edit_user_registration_path || root_url
    else
      flash[:notice] = "Welcome to your Waterall!"
      root_url
    end
    
  end
end
