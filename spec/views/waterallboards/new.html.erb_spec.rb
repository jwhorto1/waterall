require 'spec_helper'

describe "waterallboards/new" do
  before(:each) do
    assign(:waterallboard, stub_model(Waterallboard,
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "MyString",
      :zipcode => "MyString",
      :boardnumber => "MyString",
      :boardmodel => "MyString",
      :person_id => 1,
      :channels => 1
    ).as_new_record)
  end

  it "renders new waterallboard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", waterallboards_path, "post" do
      assert_select "input#waterallboard_latitude[name=?]", "waterallboard[latitude]"
      assert_select "input#waterallboard_longitude[name=?]", "waterallboard[longitude]"
      assert_select "input#waterallboard_address[name=?]", "waterallboard[address]"
      assert_select "input#waterallboard_zipcode[name=?]", "waterallboard[zipcode]"
      assert_select "input#waterallboard_boardnumber[name=?]", "waterallboard[boardnumber]"
      assert_select "input#waterallboard_boardmodel[name=?]", "waterallboard[boardmodel]"
      assert_select "input#waterallboard_person_id[name=?]", "waterallboard[person_id]"
      assert_select "input#waterallboard_channels[name=?]", "waterallboard[channels]"
    end
  end
end
