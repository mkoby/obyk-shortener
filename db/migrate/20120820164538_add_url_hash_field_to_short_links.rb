class AddUrlHashFieldToShortLinks < ActiveRecord::Migration
  def change
    add_column :short_links, :url_hash, :binary

    ShortLink.all.each do |link|
      link.update_attributes( :url_hash => Digest::SHA1.hexdigest(link.full_link) )
      link.save
    end

    add_index :short_links, :url_hash
  end
end
