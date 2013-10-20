require 'spec_helper'

describe "channels/show" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel,
      :board_id => 1,
      :name => "Name",
      :number => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/2/)
  end
end
