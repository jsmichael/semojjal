class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :folder_name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
