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
end
