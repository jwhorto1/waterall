require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :role_di => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :active => false
      ),
      stub_model(Person,
        :role_di => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :active => false
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
