module UserHelper
  def user_avatar_url(user, options = { size: 150 })
    # Returns the Gravatar url for the given user with generic default
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      size = options[:size]
      "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&m='identicon'"
  end
  def check_my_first_boards_existance(user)
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    puts request.location
    if Board.find_by_person_id(user.person.id)
    else
      if !request.location.state.present? #localhost or test
        addr = "Tempe, AZ 85282"
        board = Board.new
        board.name = "My first Board<local>"
        board.people << user.person
        board.address = addr
        board.zipcode = "85282"
      else
        result = request.location
        addr = "#{result.try(:city)}, #{result.try(:state)} #{result.try(:postal_code)}"
        board = Board.new
        board.name = "My first Board"
        board.people << user.person
        board.address = addr
        board.zipcode = result.try(:postal_code) || "00000"
        puts result.address
      end
      ### test
      # puts addr
      # puts user.person
      # puts board.save
      # puts board.errors.messages
      # puts board.inspect.to_s

    end
  end
end
