require 'spec_helper'

describe "triggers/new" do
  before(:each) do
    assign(:trigger, stub_model(Trigger,
      :int => "",
      :g => "MyString",
      :scaffold => "MyString",
      :trigger => "MyString",
      :int => "",
      :time => "",
      :int => "",
      :int => "",
      :string => "",
      :bool => "",
      :string => "",
      :text => ""
    ).as_new_record)
  end

  it "renders new trigger form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", triggers_path, "post" do
      assert_select "input#trigger_int[name=?]", "trigger[int]"
      assert_select "input#trigger_g[name=?]", "trigger[g]"
      assert_select "input#trigger_scaffold[name=?]", "trigger[scaffold]"
      assert_select "input#trigger_trigger[name=?]", "trigger[trigger]"
      assert_select "input#trigger_int[name=?]", "trigger[int]"
      assert_select "input#trigger_time[name=?]", "trigger[time]"
      assert_select "input#trigger_int[name=?]", "trigger[int]"
      assert_select "input#trigger_int[name=?]", "trigger[int]"
      assert_select "input#trigger_string[name=?]", "trigger[string]"
      assert_select "input#trigger_bool[name=?]", "trigger[bool]"
      assert_select "input#trigger_string[name=?]", "trigger[string]"
      assert_select "input#trigger_text[name=?]", "trigger[text]"
    end
  end
end
