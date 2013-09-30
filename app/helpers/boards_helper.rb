module BoardsHelper
  def google_maps_image(board, options = { width: 450, height: 300 })
    # Returns the google maps image url for the given user with generic default
      width  = options[:width]
      height = options[:height]
      "http://maps.google.com/maps/api/staticmap?size=#{width}x#{height}&sensor=false&zoom=16&markers=#{board.try(:latitude)}%2C#{board.try(:longitude)}"
  end
end
