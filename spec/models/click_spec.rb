require 'spec_helper'

describe Click do
  before(:each) do
    @full_url = "http://www.mkoby.com"
    @short_code = ShortLink.create(:full_link => @full_url)
  end

  describe "Basic creation" do
    before(:each) do
      @click = Click.create(Factory.attributes_for(:click, :short_link => @short_code))
    end

    subject { @click }
    its(:referrer_host) { should == "twitter.com" }
  end

end

