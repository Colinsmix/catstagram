class CreateMeows < ActiveRecord::Migration
  def change
    create_table :meows do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end

    add_index :meows, [:post_id, :user_id], unique: true
  end
end
