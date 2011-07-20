require 'spec_helper'

describe "contributors/new.html.haml" do
  before(:each) do
    assign(:contributor, stub_model(Contributor,
      :name => "MyString",
      :github_username => "MyString",
      :diaspora_id => "MyString",
      :bio => "MyText",
      :avatar => "MyString"
    ).as_new_record)
  end

  it "renders new contributor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contributors_path, :method => "post" do
      assert_select "input#contributor_name", :name => "contributor[name]"
      assert_select "input#contributor_github_username", :name => "contributor[github_username]"
      assert_select "input#contributor_diaspora_id", :name => "contributor[diaspora_id]"
      assert_select "textarea#contributor_bio", :name => "contributor[bio]"
      assert_select "input#contributor_avatar", :name => "contributor[avatar]"
    end
  end
end
