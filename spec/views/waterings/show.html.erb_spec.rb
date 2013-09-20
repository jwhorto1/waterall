require 'spec_helper'

describe "waterings/show" do
  before(:each) do
    @watering = assign(:watering, stub_model(Watering,
      :version => 1,
      :channel => 2,
      :user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
