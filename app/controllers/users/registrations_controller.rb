class Users::RegistrationsController < Devise::RegistrationsController 
 
  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    begin
      person = Person.find_or_initialize_by(user_id: resource.id)
      if params[:user][:people]
        person.first_name = params[:user][:people][:first_name]
        person.last_name = params[:user][:people][:last_name]
      end
    rescue StandardError => failedWith
      person.first_name = "_"
      person.last_name = "_"
    end 
    if person.save
      #do nothing for now
      puts person.first_name
      puts person.last_name
      puts "\n\n\n\n\n\nSaved!"
    else
      #do nothing for now
      puts "\n\n\n\n\n\nNot Saved!"
      
    end
    if update_resource(resource, account_update_params)
      if is_navigational_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
    
    # def create
    #   build_resource      
    #   if resource.save
    #     if resource.active_for_authentication?
    #       set_flash_message :notice, :signed_up if is_navigational_format?
    #       sign_in(resource_name, resource)
    #       respond_with resource, :location => redirect_location(resource_name, resource)
    #     else
    #       set_flash_message :warning, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
    #       expire_session_data_after_sign_in!
    #       respond_with resource, :location => after_inactive_sign_up_path_for(resource)
    #     end
    #   else
    #     clean_up_passwords(resource)
    #     respond_with_navigational(resource) { render_with_scope :new }
    #   end
    # end
   
end
