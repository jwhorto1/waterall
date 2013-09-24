require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :role_di => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :active => false
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_path(@person), "post" do
      assert_select "input#person_role_di[name=?]", "person[role_di]"
      assert_select "input#person_first_name[name=?]", "person[first_name]"
      assert_select "input#person_last_name[name=?]", "person[last_name]"
      assert_select "input#person_email[name=?]", "person[email]"
      assert_select "input#person_active[name=?]", "person[active]"
    end
  end
end
