require 'spec_helper'

describe "triggers/show" do
  before(:each) do
    @trigger = assign(:trigger, stub_model(Trigger,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/G/)
    rendered.should match(/Scaffold/)
    rendered.should match(/Trigger/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
