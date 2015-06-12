module PetRequestsHelper
  def can_create_pet_requests?
    user_signed_in?
  end

  def can_edit_pet_request?(pet_request)
    user_signed_in? && current_user.can_edit_pet_request?(pet_request)
  end
end
