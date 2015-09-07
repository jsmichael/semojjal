class CreateTestDbs < ActiveRecord::Migration
  def change
    create_table :test_dbs do |t|
      t.string :testtest
      t.timestamps null: false
    end
  end
end
