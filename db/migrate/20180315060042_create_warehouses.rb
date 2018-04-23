class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|

    t.text :name
    t.text :description
    t.references :user, foreign_key: true
    t.text :address
    t.text :manager
    t.integer :manager_phone_number
    t.text :manager_email
    t.integer :region
      
    end
    add_index :warehouses, [:user_id, :created_at]

  end
end