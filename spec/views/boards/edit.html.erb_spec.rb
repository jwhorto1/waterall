require 'spec_helper'

describe "boards/edit" do
  before(:each) do
    @board = assign(:board, stub_model(Board,
      :address => "MyString",
      :zipcode => "MyString"
    ))
  end

  it "renders the edit board form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", board_path(@board), "post" do
      assert_select "input#board_address[name=?]", "board[address]"
      assert_select "input#board_zipcode[name=?]", "board[zipcode]"
    end
  end
end
