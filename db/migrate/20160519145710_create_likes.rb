class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
    	t.integer :customer_id, :ptemple_id
    	t.timestamps
    end
  end
end
