class PostInDiscordJob < ApplicationJob
  queue_as :default

  def perform(pet_request)
    Rails.logging.info "OMG Pet request! #{pet_request.inspect}"
  end
end
