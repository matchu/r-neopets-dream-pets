module PetRequestsHelper
  def can_edit_pet_request?(pet_request)
    user_signed_in? && current_user.can_edit_pet_request?(pet_request)
  end

  def name_quality_option_text(name_quality)
    "#{name_quality.abbreviation}: #{name_quality.description}"
  end

  def pet_requests_table_cache_key(pet_requests)
    return 'pet_requests/table-empty' if pet_requests.empty?

    count = pet_requests.size
    max_updated_at = pet_requests.map(&:updated_at).max.utc.to_s
    "pet_requests/table-#{count}-#{max_updated_at}"
  end
end
