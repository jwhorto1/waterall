class Users::RegistrationsController < Devise::RegistrationsController 
 
  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    begin
      person = Person.find_or_initialize_by(user_id: resource.id)
      if params[:user][:person_attributes]
        person.first_name = params[:user][:person_attributes][:first_name]
        person.last_name  = params[:user][:person_attributes][:last_name]
        person.email      = params[:user][:email]
      end
    rescue StandardError => failedWith
      person.first_name = "_"
      person.last_name = "_"
    end 
    if person.save
      puts "\n\n\n\n\n\nSaved!"
      #create person's first default board
      if !(Board.find_by_person_id(person.id))
        result = request.location
        addr = "#{result.try(:city)}, #{result.try(:state)} #{result.try(:zipcode)}"
        board = Board.new
        board.address = addr
        puts board.save
        puts board.inspect.to_s
      end
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
    
  # POST /resource
  def create
    build_resource(sign_up_params)
    
    if resource.save
      #create a person
      person = Person.new
      person.email      = resource.email
      person.user_id    = resource.id
      #create person's first default board
      result = request.location
      addr = "#{result.try(:city)}, #{result.try(:state)} #{result.try(:zipcode)}"
      board = Board.new
      board.address = addr
      
      if person.save & board.save
        #do nothing for now
      else 
        #do nothing for now
      end
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
   
end
