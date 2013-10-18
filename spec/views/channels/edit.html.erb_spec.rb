require 'spec_helper'

describe "channels/edit" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel,
      :board_id => 1,
      :name => "MyString",
      :number => 1
    ))
  end

  it "renders the edit channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", channel_path(@channel), "post" do
      assert_select "input#channel_board_id[name=?]", "channel[board_id]"
      assert_select "input#channel_name[name=?]", "channel[name]"
      assert_select "input#channel_number[name=?]", "channel[number]"
    end
  end
end
