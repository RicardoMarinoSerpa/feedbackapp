ActiveAdmin.register Feedback do

 permit_params :staffing_id, :sender_user_id, :receiver_user_id, :subdimension_id, :grade, :comment, :receiver_visible, :mentor_visible
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
