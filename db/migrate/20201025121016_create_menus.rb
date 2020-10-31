class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
    	t.integer :genre_id
      t.integer :user_id, null: false
    	t.string :name
    	t.string :title, null: false
    	t.integer :body, null: false
    	t.boolean :is_active,default:true, null: false

      t.timestamps
    end
  end
end
