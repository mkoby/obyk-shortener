class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.references :short_link
      t.string :referrer_host
      t.string :referrer_path

      t.timestamps
    end
    add_index :clicks, :short_link_id
  end
end
