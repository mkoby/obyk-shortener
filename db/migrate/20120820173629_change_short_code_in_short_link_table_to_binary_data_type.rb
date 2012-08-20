class ChangeShortCodeInShortLinkTableToBinaryDataType < ActiveRecord::Migration
  def up
    change_table :short_links do |t|
      short_code_hash = Hash.new
      ShortLink.all.each do |s|
        short_code_hash[s.id.to_s] = s.short_code
        s.short_code = nil
        s.save
      end

      t.change :short_code, :binary

      short_code_hash.each do |key, value|
        s = ShortLink.find_by_id(key.to_i)
        s.short_code = value
        s.save
      end
    end
  end

  def down
    change_table :short_links do |t|
      t.change :short_code, :string
    end
  end
end
