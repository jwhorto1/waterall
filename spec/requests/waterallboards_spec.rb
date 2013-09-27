require 'spec_helper'

describe "Waterallboards" do
  describe "GET /waterallboards" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get waterallboards_path
      response.status.should be(200)
    end
  end
end
