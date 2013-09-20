require 'spec_helper'

describe "waterings/new" do
  before(:each) do
    assign(:watering, stub_model(Watering,
      :version => 1,
      :channel => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new watering form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", waterings_path, "post" do
      assert_select "input#watering_version[name=?]", "watering[version]"
      assert_select "input#watering_channel[name=?]", "watering[channel]"
      assert_select "input#watering_user_id[name=?]", "watering[user_id]"
    end
  end
end
