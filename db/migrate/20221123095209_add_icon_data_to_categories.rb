class AddIconDataToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :icon_data, :text
  end
end
