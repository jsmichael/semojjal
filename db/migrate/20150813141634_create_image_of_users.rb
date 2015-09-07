class CreateImageOfUsers < ActiveRecord::Migration
  def change
    create_table :image_of_users do |t|
      
      t.integer   :user_id
      t.integer   :image_id
      t.boolean   :selected, default:false
      
      t.timestamps null: false
    end
  end
end
