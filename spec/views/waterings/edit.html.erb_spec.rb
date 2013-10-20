require 'spec_helper'

describe "waterings/edit" do
  before(:each) do
    @watering = assign(:watering, stub_model(Watering,
      :version => 1,
      :channel => 1,
      :user_id => 1
    ))
  end

  it "renders the edit watering form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", watering_path(@watering), "post" do
      assert_select "input#watering_version[name=?]", "watering[version]"
      assert_select "input#watering_channel[name=?]", "watering[channel]"
      assert_select "input#watering_user_id[name=?]", "watering[user_id]"
    end
  end
end
