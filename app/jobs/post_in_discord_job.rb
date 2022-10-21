require 'net/http'

class PostInDiscordJob < ApplicationJob
  queue_as :default

  if ENV['DISCORD_WEBHOOK_URL']
    ENABLED = true
    DISCORD_WEBHOOK_URL = URI.parse(ENV['DISCORD_WEBHOOK_URL'])
    HTTP_CLIENT = Net::HTTP.new(DISCORD_WEBHOOK_URL.host, DISCORD_WEBHOOK_URL.port)
    HTTP_CLIENT.use_ssl = true
  else
    ENABLED = false
  end

  def perform(pet_request)
    if !ENABLED
      logger.warn("No DISCORD_WEBHOOK_URL env variable was specified, so " +
        "PostInDiscordJob is a no-op.")
      return
    end

    request = Net::HTTP::Post.new(DISCORD_WEBHOOK_URL.request_uri,
      {'Content-Type' => 'application/json'})
    request.body = build_discord_message(pet_request).to_json

    response = HTTP_CLIENT.request(request)
    if !response.kind_of?(Net::HTTPSuccess)
      raise "Discord webhook request failed: " +
        "#{response.code} #{response.message}. " +
        "Body: #{response.body}"
    end

    logger.info "Successfully posted request to Discord: #{pet_request.id} (by #{pet_request.creator.name})"
  end

  private

  def build_discord_message(pet_request)
    message = {
      embeds: [{
        color: 0xFF00FF,
        timestamp: pet_request.created_at.utc.iso8601,
        author: {
          # This attribute won't be presented as Markdown, so isn't escaped.
          name: "Dream Pet added by /u/#{pet_request.creator.name}",
          url: "https://www.reddit.com/user/#{pet_request.creator.name}",
        },
        footer: {
          text: 'Pet added at',
        },
        fields: [
          {
            name: 'Pet Wanted',
            value: escape_markdown(pet_request.summary_string),
            inline: false,
          },
          {
            name: 'Requires Clothes',
            value: pet_request.requires_clothes? ? 'Yes' : 'No',
            inline: false,
          },
        ],
      }],
    }

    # Only include the info field if there's info.
    if pet_request.info?
      message[:embeds][0][:fields] << {
        name: 'Other Info',
        value: escape_markdown(pet_request.info),
        inline: false,
      }
    end

    message
  end

  def escape_markdown(str)
    str.gsub /(\*|_|`)/, '\\\\\\1'
  end
end
