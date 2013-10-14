require 'spec_helper'

describe "triggers/index" do
  before(:each) do
    assign(:triggers, [
      stub_model(Trigger,
        :int => "",
        :g => "G",
        :scaffold => "Scaffold",
        :trigger => "Trigger",
        :int => "",
        :time => "",
        :int => "",
        :int => "",
        :string => "",
        :bool => "",
        :string => "",
        :text => ""
      ),
      stub_model(Trigger,
        :int => "",
        :g => "G",
        :scaffold => "Scaffold",
        :trigger => "Trigger",
        :int => "",
        :time => "",
        :int => "",
        :int => "",
        :string => "",
        :bool => "",
        :string => "",
        :text => ""
      )
    ])
  end

  it "renders a list of triggers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "G".to_s, :count => 2
    assert_select "tr>td", :text => "Scaffold".to_s, :count => 2
    assert_select "tr>td", :text => "Trigger".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
