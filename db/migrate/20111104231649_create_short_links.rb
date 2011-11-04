class CreateShortLinks < ActiveRecord::Migration
  def change
    create_table :short_links do |t|
      t.string :full_link
      t.string :short_code

      t.timestamps
    end
  end
end
