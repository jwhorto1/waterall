require 'spec_helper'

describe "channels/index" do
  before(:each) do
    assign(:channels, [
      stub_model(Channel,
        :board_id => 1,
        :name => "Name",
        :number => 2
      ),
      stub_model(Channel,
        :board_id => 1,
        :name => "Name",
        :number => 2
      )
    ])
  end

  it "renders a list of channels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
