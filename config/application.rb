require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RNeopetsDreamPets
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # In all environments, including production, we're still just using the
    # simple async job queue. At time of writing, our only job is the
    # PostToDiscordJob, which is super non-essential, so it's totally okay to
    # drop jobs if something goes wrong.
    config.active_job.queue_adapter = :async

    # How many pets a user can request at once. In production, this is
    # overridden to an actual maximum value.
    config.x.user_maximum_pet_requests = Float::INFINITY

    # To serialize OmniAuth hashes in user.rb, we must mark them as
    # allowable data classes for YAML.
    config.active_record.yaml_column_permitted_classes = [
      OmniAuth::AuthHash,
      OmniAuth::AuthHash::InfoHash,
      Hashie::Array,
    ]
  end
end
