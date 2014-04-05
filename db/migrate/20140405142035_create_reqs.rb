class CreateReqs < ActiveRecord::Migration
  def change
    create_table :reqs do |t|
      t.string :referrer
      t.string :location
      t.string :resolution
      t.string :useragent
      t.string :ip
      t.string :client_id

      t.timestamps
    end
  end
end
