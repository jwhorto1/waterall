require 'spec_helper'

describe "boardshortmessages/index" do
  before(:each) do
    assign(:boardshortmessages, [
      stub_model(Boardshortmessage,
        :board_id => "Board",
        :channel1_on_in_seconds => "Channel1 On In Seconds",
        :channel2_on_in_seconds => "Channel2 On In Seconds",
        :channel3_on_in_seconds => "Channel3 On In Seconds",
        :channel4_on_in_seconds => "Channel4 On In Seconds",
        :channel5_on_in_seconds => "Channel5 On In Seconds",
        :channel6_on_in_seconds => "Channel6 On In Seconds",
        :channel7_on_in_seconds => "Channel7 On In Seconds",
        :channel8_on_in_seconds => "Channel8 On In Seconds",
        :randomaccesscode => 1,
        :scalediv32 => 2,
        :year => 3,
        :month => 4,
        :day => 5,
        :hour => 6,
        :minute => 7,
        :second => 8,
        :channel1 => 9,
        :channel2 => 10,
        :channel3 => 11,
        :channel4 => 12,
        :channel5 => 13,
        :channel6 => 14,
        :channel7 => 15,
        :channel8 => 16,
        :sendstatus => 17,
        :echo => 18,
        :willsend => 19,
        :checksum => 20,
        :concatinated_board_ascii => "Concatinated Board Ascii"
      ),
      stub_model(Boardshortmessage,
        :board_id => "Board",
        :channel1_on_in_seconds => "Channel1 On In Seconds",
        :channel2_on_in_seconds => "Channel2 On In Seconds",
        :channel3_on_in_seconds => "Channel3 On In Seconds",
        :channel4_on_in_seconds => "Channel4 On In Seconds",
        :channel5_on_in_seconds => "Channel5 On In Seconds",
        :channel6_on_in_seconds => "Channel6 On In Seconds",
        :channel7_on_in_seconds => "Channel7 On In Seconds",
        :channel8_on_in_seconds => "Channel8 On In Seconds",
        :randomaccesscode => 1,
        :scalediv32 => 2,
        :year => 3,
        :month => 4,
        :day => 5,
        :hour => 6,
        :minute => 7,
        :second => 8,
        :channel1 => 9,
        :channel2 => 10,
        :channel3 => 11,
        :channel4 => 12,
        :channel5 => 13,
        :channel6 => 14,
        :channel7 => 15,
        :channel8 => 16,
        :sendstatus => 17,
        :echo => 18,
        :willsend => 19,
        :checksum => 20,
        :concatinated_board_ascii => "Concatinated Board Ascii"
      )
    ])
  end

  it "renders a list of boardshortmessages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Board".to_s, :count => 2
    assert_select "tr>td", :text => "Channel1 On In Seconds".to_s, :count => 2
    assert_select "tr>td", :text => "Channel2 On In Seconds".to_s, :count => 2
    assert_select "tr>td", :text => "Channel3 On In Seconds".to_s, :count => 2
    assert_select "tr>td", :text => "Channel4 On In Seconds".to_s, :count => 2
    assert_select "tr>td", :text => "Channel5 On In Seconds".to_s, :count => 2
    assert_select "tr>td", :text => "Channel6 On In Seconds".to_s, :count => 2
    assert_select "tr>td", :text => "Channel7 On In Seconds".to_s, :count => 2
    assert_select "tr>td", :text => "Channel8 On In Seconds".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => 16.to_s, :count => 2
    assert_select "tr>td", :text => 17.to_s, :count => 2
    assert_select "tr>td", :text => 18.to_s, :count => 2
    assert_select "tr>td", :text => 19.to_s, :count => 2
    assert_select "tr>td", :text => 20.to_s, :count => 2
    assert_select "tr>td", :text => "Concatinated Board Ascii".to_s, :count => 2
  end
end
