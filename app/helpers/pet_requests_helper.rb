module PetRequestsHelper
  def can_edit_pet_request?(pet_request)
    user_signed_in? && current_user.can_edit_pet_request?(pet_request)
  end

  def name_quality_option_text(name_quality)
    "#{name_quality.abbreviation}: #{name_quality.description}"
  end
end
