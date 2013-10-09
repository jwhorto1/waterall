require 'spec_helper'

describe "channels/new" do
  before(:each) do
    assign(:channel, stub_model(Channel,
      :board_id => 1,
      :name => "MyString",
      :number => 1
    ).as_new_record)
  end

  it "renders new channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", channels_path, "post" do
      assert_select "input#channel_board_id[name=?]", "channel[board_id]"
      assert_select "input#channel_name[name=?]", "channel[name]"
      assert_select "input#channel_number[name=?]", "channel[number]"
    end
  end
end
