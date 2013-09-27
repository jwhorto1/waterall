require 'spec_helper'

describe "boards/new" do
  before(:each) do
    assign(:board, stub_model(Board,
      :address => "MyString",
      :zipcode => "MyString"
    ).as_new_record)
  end

  it "renders new board form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", boards_path, "post" do
      assert_select "input#board_address[name=?]", "board[address]"
      assert_select "input#board_zipcode[name=?]", "board[zipcode]"
    end
  end
end
