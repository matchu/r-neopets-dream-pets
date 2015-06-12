json.array!(@pet_requests) do |pet_request|
  json.extract! pet_request, :id, :species_id, :color_id, :conversion_state_id, :minimum_name_quality_id, :info, :creator_id, :requires_clothes
  json.url pet_request_url(pet_request, format: :json)
end
