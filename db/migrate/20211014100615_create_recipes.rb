class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
