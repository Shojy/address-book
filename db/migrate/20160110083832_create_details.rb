class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :contact_id
      t.string :label
      t.string :value

      t.timestamps null: false
    end
  end
end
