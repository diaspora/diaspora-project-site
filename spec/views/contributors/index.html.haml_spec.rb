require 'spec_helper'

describe "contributors/index.html.haml" do
  before(:each) do
    assign(:contributors, [
      stub_model(Contributor,
        :name => "Name",
        :github_username => "Github Username",
        :diaspora_id => "Diaspora",
        :bio => "MyText",
        :avatar => "Avatar"
      ),
      stub_model(Contributor,
        :name => "Name",
        :github_username => "Github Username",
        :diaspora_id => "Diaspora",
        :bio => "MyText",
        :avatar => "Avatar"
      )
    ])
  end

  it "renders a list of contributors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Github Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Diaspora".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
  end
end
