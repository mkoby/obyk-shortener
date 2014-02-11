class ShortLink < ActiveRecord::Base
  before_create :attach_url_hash
  before_save :attach_short_code
  BASE_URL = "http://obyk.herokuapp.com/"

  validates_presence_of :full_link, :message => "You must provide a URL to shorten"
  validates_format_of :full_link, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :message => "Link must begin with 'http://' or 'https://'. Example: http://obyk.us"
  has_many :clicks

  def ShortLink.get_short_code(full_url, length = 5)
    #SHA the link + the time as a float to get a unique hash result.
    #This is so the chances of generating the same hash and thus the
    #same short code is (in theory) more difficult
    sha1 = Digest::SHA1.hexdigest("#{full_url}#{Time.now.to_f}")
    sha1[0, length]
  end

  def full_short_link
    return "#{BASE_URL}#{self.short_code}"
  end

  private

  def attach_url_hash
    return if self.url_hash
    self.url_hash = Digest::SHA1.hexdigest(self.full_link)
  end

  def attach_short_code
    return if self.short_code
    self.short_code = ShortLink.get_short_code(self.full_link).to_s
  end
end

