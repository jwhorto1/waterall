module UserHelper
  def user_avatar_url(user, options = { size: 150 })
    # Returns the Gravatar url for the given user with generic default
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      size = options[:size]
      "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&m='identicon'"
  end
  def check_my_first_boards_existance(user)
    puts "\n\n\n\n\n\n\n\nchecking"
    if Board.find_by_person_id(user.person.id)
    else
      result = request.location
      addr = "#{result.try(:city)}, #{result.try(:state)} #{result.try(:postal_code)}"
      board = Board.new
      board.person_id = user.person.id
      board.address = addr
      puts board.save
      puts board.inspect.to_s
    end
  end
end
