require 'spec_helper'

describe "stories/show" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :title => "Title",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Category/)
  end
end
