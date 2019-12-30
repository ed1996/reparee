ActiveAdmin.register Entreprise do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :artisan_type, :company_name, :code_naf, :siren, :siret, :address, :phone, :legal_form, :linkweb, :is_card, :is_cheque, :is_cash, :active, :user_id, :latitude, :longitude
  #
  # or
  #
   permit_params do
     permitted = [:artisan_type, :company_name, :code_naf, :siren, :siret, :address, :phone, :legal_form, :linkweb, :is_card, :is_cheque, :is_cash, :active, :user_id, :latitude, :longitude]
     permitted << :other if params[:action] == 'create' && current_user.admin?
     permitted
   end
  
end
