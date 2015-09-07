class CreateImagefolders < ActiveRecord::Migration
  def change
    create_table :imagefolders do |t|
      
      t.integer   :folder_id
      t.integer   :image_id

      t.timestamps null: false
    end
  end
end
