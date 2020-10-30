class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
    	t.integer :genre_id, null: false
    	t.string :name, null: false
    	t.string :title, null: false
    	t.integer :body, null: false
    	t.boolean :is_active,default:true, null: false

      t.timestamps
    end
  end
end
