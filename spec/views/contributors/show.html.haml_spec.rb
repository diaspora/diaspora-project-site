require 'spec_helper'

describe "contributors/show.html.haml" do
  before(:each) do
    @contributor = assign(:contributor, stub_model(Contributor,
      :name => "Name",
      :github_username => "Github Username",
      :diaspora_id => "Diaspora",
      :bio => "MyText",
      :avatar => "Avatar"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Github Username/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Diaspora/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Avatar/)
  end
end
