#I have chosen to do exactly one (1) assetion per test
require 'test_helper'
class BoardTest < ActiveSupport::TestCase
  test "invalid without a name" do
    b = Board.new
    assert !b.valid?, "Name is not being validated"
  end
  test "valid with all attributes" do
    b = boards(:valid_board)
    assert b.valid?, "=> board has all attributes."
  end
  test "invalid without zipcode" do
    b = boards(:bad_zipcode_board)
    assert !b.valid?, "=> board has no valid zipcode."
  end
  test "invalid without name" do
    b = boards(:no_name_board)
    assert !b.valid?, "=> board has no valid zipcode."
  end
  test "invalid without address" do
    b = boards(:no_address_board)
    assert !b.valid?, "=> board has no valid zipcode."
  end
  test "name too long gives error message" do
    b = boards(:valid_board)
    b.name = "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
    b.valid?
    assert_match /can not be longer than/, b.errors[:name].join, "=> Length error for name not found on board."
  end
  test "test I have timezone set up" do
    b = boards(:valid_board)
    assert_respond_to b, :timezone
  end
  test "invalid without timezone" do
    b = boards(:valid_board)
    b.timezone = nil
    assert !b.valid?, "=> board has no valid timezone."
  end
end

#            :id => :integer,
#      :latitude => :float,
#     :longitude => :float,
#       :address => :string,
#       :zipcode => :string,
#   :boardnumber => :string,
#    :boardmodel => :string,
#     :person_id => :integer,
#      :channels => :integer,
#            :ip => :string,
#        :status => :string,
# :googlemap_url => :string,
#    :created_at => :datetime,
#    :updated_at => :datetime,
#          :name => :string,
#   :description => :text,
#         :image => :string