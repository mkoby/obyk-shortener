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
    end

    subject { @short_link }
    its(:short_code) { should_not be_nil }
    its('short_code.length') { should == 5}
    its(:full_link) { should == @full_url }
  end
end

