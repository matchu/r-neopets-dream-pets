module ApplicationHelper
  def link_to_user(user)
    if user.provider == 'reddit'
      link_to user.name, reddit_user_path(user.name)
    else
      user.name
    end
  end

  def contact_us_path
    'http://www.reddit.com/message/compose?to=%2Fr%2FNeopetsDreamPets'
  end

  def reddit_user_path(name)
    "https://www.reddit.com/user/#{name}"
  end

  def subreddit_path(name)
    "https://www.reddit.com/r/#{name}"
  end

  def source_code_path
    "https://github.com/matchu/r-neopets-dream-pets"
  end

  HEROKU_APP_GOES_DOWN_APPROXIMATELY_AT = Time.new(2022, 11, 28)
  HEROKU_MESSAGE_BECOMES_IRRELEVANT_AT = Time.new(2022, 12, 28)

  def heroku_app_is_probably_still_up?
    Time.now < HEROKU_APP_GOES_DOWN_APPROXIMATELY_AT
  end

  def heroku_message_is_still_relevant?
    Time.now < HEROKU_MESSAGE_BECOMES_IRRELEVANT_AT
  end
end
