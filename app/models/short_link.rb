class ShortLink < ActiveRecord::Base
  before_save :attach_short_code
  BASE_URL = "http://obyk.us/"

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

  def attach_short_code
    return if self.short_code
    self.short_code = ShortLink.get_short_code(self.full_link).to_s
  end
end

