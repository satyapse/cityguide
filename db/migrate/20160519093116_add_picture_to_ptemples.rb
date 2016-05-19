class AddPictureToPtemples < ActiveRecord::Migration
  def change
    add_column :ptemples, :picture, :string
  end
end
