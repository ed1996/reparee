ActiveAdmin.register Reservation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :entreprise_id, :start_date, :hour, :minute, :description, :address, :phone, :postal_code
  #
  # or
  #
   permit_params do
     permitted = [:user_id, :entreprise_id, :start_date, :hour, :minute, :description, :address, :phone, :postal_code]
     permitted << :other if params[:action] == 'create' && current_user.admin?
     permitted
   end
  
end
