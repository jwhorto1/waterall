require 'spec_helper'

describe "boardshortmessages/edit" do
  before(:each) do
    @boardshortmessage = assign(:boardshortmessage, stub_model(Boardshortmessage,
      :board_id => "MyString",
      :channel1_on_in_seconds => "MyString",
      :channel2_on_in_seconds => "MyString",
      :channel3_on_in_seconds => "MyString",
      :channel4_on_in_seconds => "MyString",
      :channel5_on_in_seconds => "MyString",
      :channel6_on_in_seconds => "MyString",
      :channel7_on_in_seconds => "MyString",
      :channel8_on_in_seconds => "MyString",
      :randomaccesscode => 1,
      :scalediv32 => 1,
      :year => 1,
      :month => 1,
      :day => 1,
      :hour => 1,
      :minute => 1,
      :second => 1,
      :channel1 => 1,
      :channel2 => 1,
      :channel3 => 1,
      :channel4 => 1,
      :channel5 => 1,
      :channel6 => 1,
      :channel7 => 1,
      :channel8 => 1,
      :sendstatus => 1,
      :echo => 1,
      :willsend => 1,
      :checksum => 1,
      :concatinated_board_ascii => "MyString"
    ))
  end

  it "renders the edit boardshortmessage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", boardshortmessage_path(@boardshortmessage), "post" do
      assert_select "input#boardshortmessage_board_id[name=?]", "boardshortmessage[board_id]"
      assert_select "input#boardshortmessage_channel1_on_in_seconds[name=?]", "boardshortmessage[channel1_on_in_seconds]"
      assert_select "input#boardshortmessage_channel2_on_in_seconds[name=?]", "boardshortmessage[channel2_on_in_seconds]"
      assert_select "input#boardshortmessage_channel3_on_in_seconds[name=?]", "boardshortmessage[channel3_on_in_seconds]"
      assert_select "input#boardshortmessage_channel4_on_in_seconds[name=?]", "boardshortmessage[channel4_on_in_seconds]"
      assert_select "input#boardshortmessage_channel5_on_in_seconds[name=?]", "boardshortmessage[channel5_on_in_seconds]"
      assert_select "input#boardshortmessage_channel6_on_in_seconds[name=?]", "boardshortmessage[channel6_on_in_seconds]"
      assert_select "input#boardshortmessage_channel7_on_in_seconds[name=?]", "boardshortmessage[channel7_on_in_seconds]"
      assert_select "input#boardshortmessage_channel8_on_in_seconds[name=?]", "boardshortmessage[channel8_on_in_seconds]"
      assert_select "input#boardshortmessage_randomaccesscode[name=?]", "boardshortmessage[randomaccesscode]"
      assert_select "input#boardshortmessage_scalediv32[name=?]", "boardshortmessage[scalediv32]"
      assert_select "input#boardshortmessage_year[name=?]", "boardshortmessage[year]"
      assert_select "input#boardshortmessage_month[name=?]", "boardshortmessage[month]"
      assert_select "input#boardshortmessage_day[name=?]", "boardshortmessage[day]"
      assert_select "input#boardshortmessage_hour[name=?]", "boardshortmessage[hour]"
      assert_select "input#boardshortmessage_minute[name=?]", "boardshortmessage[minute]"
      assert_select "input#boardshortmessage_second[name=?]", "boardshortmessage[second]"
      assert_select "input#boardshortmessage_channel1[name=?]", "boardshortmessage[channel1]"
      assert_select "input#boardshortmessage_channel2[name=?]", "boardshortmessage[channel2]"
      assert_select "input#boardshortmessage_channel3[name=?]", "boardshortmessage[channel3]"
      assert_select "input#boardshortmessage_channel4[name=?]", "boardshortmessage[channel4]"
      assert_select "input#boardshortmessage_channel5[name=?]", "boardshortmessage[channel5]"
      assert_select "input#boardshortmessage_channel6[name=?]", "boardshortmessage[channel6]"
      assert_select "input#boardshortmessage_channel7[name=?]", "boardshortmessage[channel7]"
      assert_select "input#boardshortmessage_channel8[name=?]", "boardshortmessage[channel8]"
      assert_select "input#boardshortmessage_sendstatus[name=?]", "boardshortmessage[sendstatus]"
      assert_select "input#boardshortmessage_echo[name=?]", "boardshortmessage[echo]"
      assert_select "input#boardshortmessage_willsend[name=?]", "boardshortmessage[willsend]"
      assert_select "input#boardshortmessage_checksum[name=?]", "boardshortmessage[checksum]"
      assert_select "input#boardshortmessage_concatinated_board_ascii[name=?]", "boardshortmessage[concatinated_board_ascii]"
    end
  end
end
