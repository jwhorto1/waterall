require 'spec_helper'

describe "boardshortmessages/show" do
  before(:each) do
    @boardshortmessage = assign(:boardshortmessage, stub_model(Boardshortmessage,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Board/)
    rendered.should match(/Channel1 On In Seconds/)
    rendered.should match(/Channel2 On In Seconds/)
    rendered.should match(/Channel3 On In Seconds/)
    rendered.should match(/Channel4 On In Seconds/)
    rendered.should match(/Channel5 On In Seconds/)
    rendered.should match(/Channel6 On In Seconds/)
    rendered.should match(/Channel7 On In Seconds/)
    rendered.should match(/Channel8 On In Seconds/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/11/)
    rendered.should match(/12/)
    rendered.should match(/13/)
    rendered.should match(/14/)
    rendered.should match(/15/)
    rendered.should match(/16/)
    rendered.should match(/17/)
    rendered.should match(/18/)
    rendered.should match(/19/)
    rendered.should match(/20/)
    rendered.should match(/Concatinated Board Ascii/)
  end
end
