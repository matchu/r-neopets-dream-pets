module ApplicationHelper
  def link_to_user(user)
    if user.provider == 'reddit'
      link_to user.name, reddit_user_path(user.name)
    else
      user.name
    end
  end

  def reddit_user_path(name)
    "https://www.reddit.com/user/#{name}"
  end
end
