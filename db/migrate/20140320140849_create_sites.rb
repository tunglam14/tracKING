class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.integer :user_id
      t.string :description
      t.string :name
      t.string :url
      t.string :client_id

      t.timestamps
    end
  end
end
