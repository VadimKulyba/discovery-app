module ApplicationHelper
  def full_title(page_title)
    base_title = 'Discovery'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  def avatar_for(user, size = 150)
    avatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{avatar_id}?s=#{size}"
  end
end
