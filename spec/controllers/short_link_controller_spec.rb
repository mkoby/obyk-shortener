require 'spec_helper'

describe ShortLinkController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before(:each) do
      post :create, :short_link => { :full_link => "http://www.mkoby.com" }
      @short_link = assigns(:short_link)
    end

    subject { @short_link }
    it { should_not be_nil }
    its('short_code.length') { should == 5 }
    its(:full_link) { should == "http://www.mkoby.com" }

    it "returns http redirect" do
      response.should be_redirect
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @short_link = ShortLink.create(:full_link => "http://www.mkoby.com")
      get :show, :short_code => @short_link.short_code
    end

    it "returns http success" do
      response.should be_success
    end
  end

  describe "GET 'access'" do
    before(:each) do
      @short_link = ShortLink.create(:full_link => "http://www.mkoby.com")
      get :access, :short_code => @short_link.short_code
    end

    it "returns http redirect" do
      response.should be_redirect
    end

    subject { assigns(:short_link) }
    its(:clicks) { should_not be_empty }
  end

end

