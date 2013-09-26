module UserHelper
  def user_avatar_url(user, options = { size: 150 })
    # Returns the Gravatar url for the given user with generic default
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      size = options[:size]
      "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&m='identicon'"
  end
end
