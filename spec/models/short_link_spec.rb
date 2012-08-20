require 'spec_helper'

describe ShortLink do
  before(:each) do
    @full_url = "http://www.mkoby.com"
  end

  describe "ShortLink#get_short_code" do
    before(:each) do
      @short_code = ShortLink.get_short_code(@full_url)
    end

    subject { @short_code }
    it { should_not be_nil }
    its(:length) { should == 5}
  end

  describe "ShortLink.create" do
    before(:each) do
      @full_url = "http://www.mkoby.com"
      @short_link = ShortLink.create(:full_link => @full_url)
      @short_code = @short_link.short_code
      @url_hash = Digest::SHA1.hexdigest(@full_url)
    end

    subject { @short_link }
    its(:short_code) { should_not be_nil }
    its('short_code.length') { should == 5}
    its(:full_link) { should == @full_url }
    its(:url_hash) { should == @url_hash }
  end

  describe "clicks" do
    before(:each) do
      @short_code = ShortLink.create(:full_link => @full_url)
    end

    subject { @short_code }
    its(:clicks) { should be_empty }
  end
end

