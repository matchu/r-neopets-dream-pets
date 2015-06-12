module PetRequestsHelper
  def can_create_pet_requests?
    user_signed_in?
  end

  def can_edit_pet_request?(pet_request)
    user_signed_in? && current_user.can_edit_pet_request?(pet_request)
  end

  def pet_requests_table_cache_key
    count = PetRequest.count
    max_updated_at = PetRequest.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "pet_requests/table-#{count}-#{max_updated_at}"
  end
end
