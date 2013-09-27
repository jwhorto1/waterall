require 'spec_helper'

describe "waterallboards/show" do
  before(:each) do
    @waterallboard = assign(:waterallboard, stub_model(Waterallboard,
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "Address",
      :zipcode => "Zipcode",
      :boardnumber => "Boardnumber",
      :boardmodel => "Boardmodel",
      :person_id => 1,
      :channels => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Address/)
    rendered.should match(/Zipcode/)
    rendered.should match(/Boardnumber/)
    rendered.should match(/Boardmodel/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
