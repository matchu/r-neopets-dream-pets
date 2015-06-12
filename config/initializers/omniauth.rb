Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :reddit, ENV['REDDIT_KEY'], ENV['REDDIT_SECRET'], scope: 'identity'
end
