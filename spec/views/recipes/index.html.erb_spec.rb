require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        title: "Title",
        author: "Author",
        description: "MyText",
        image_url: "Image Url"
      ),
      Recipe.create!(
        title: "Title",
        author: "Author",
        description: "MyText",
        image_url: "Image Url"
      )
    ])
  end

  it "renders a list of recipes" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Author".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Image Url".to_s, count: 2
  end
end
