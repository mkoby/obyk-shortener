class ChangeShortCodeInShortLinkTableToBinaryDataType < ActiveRecord::Migration
  def up
    change_table :short_links do |t|
      t.change :short_code, :binary
    end
  end

  def down
    change_table :short_links do |t|
      t.change :short_code, :string
    end
  end
end
