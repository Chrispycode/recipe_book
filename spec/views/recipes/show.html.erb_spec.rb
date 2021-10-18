require 'rails_helper'

RSpec.describe "recipes/show", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      title: "Title",
      author: "Author",
      description: "MyText",
      image_url: '/images/seed_images/pexels-anna-guerrero-1765005.webp'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match('/images/seed_images/pexels-anna-guerrero-1765005.webp')
  end
end
