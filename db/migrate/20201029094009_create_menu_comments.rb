class CreateMenuComments < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :profile_image_id

      t.timestamps
    end
  end
end
