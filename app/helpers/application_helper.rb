module ApplicationHelper
  def link_to_user(provider, name)
    if provider.reddit?
      link_to name, reddit_user_path(name)
    else
      name
    end
  end

  def reddit_user_path(name)
    "https://www.reddit.com/user/#{name}"
  end
end
