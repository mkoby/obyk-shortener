class AddIndexToShortCodeColumn < ActiveRecord::Migration
  def change
    add_index :short_links, :short_code
  end
end
