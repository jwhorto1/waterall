require 'spec_helper'

describe "waterallboards/index" do
  before(:each) do
    assign(:waterallboards, [
      stub_model(Waterallboard,
        :latitude => 1.5,
        :longitude => 1.5,
        :address => "Address",
        :zipcode => "Zipcode",
        :boardnumber => "Boardnumber",
        :boardmodel => "Boardmodel",
        :person_id => 1,
        :channels => 2
      ),
      stub_model(Waterallboard,
        :latitude => 1.5,
        :longitude => 1.5,
        :address => "Address",
        :zipcode => "Zipcode",
        :boardnumber => "Boardnumber",
        :boardmodel => "Boardmodel",
        :person_id => 1,
        :channels => 2
      )
    ])
  end

  it "renders a list of waterallboards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Boardnumber".to_s, :count => 2
    assert_select "tr>td", :text => "Boardmodel".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
