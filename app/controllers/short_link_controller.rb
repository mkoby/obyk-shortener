class ShortLinkController < ApplicationController
  before_filter :get_full_link, :only => [:create]

  def new
    @short_link ||= ShortLink.new
  end

  def create
    @short_link = ShortLink.find_or_initialize_by_full_link(@full_link_string)

    if @short_link.valid?
      respond_to do |format|
        if @short_link.save
          format.html { redirect_to(show_short_link_path(@short_link.short_code)) }
          format.js {}
        end
      end
    else
      render :new
    end
  end

  def show
    @short_link = ShortLink.find_by_short_code(params[:short_code])
    @referrers = @short_link.clicks.find(:all, :select => "referrer_host, count(*) as count", :group => :referrer_host)

    respond_to do |format|
      if @short_link
        format.html { @short_link }
      end
    end
  end

  def access
    @short_link = ShortLink.find_by_short_code(params[:short_code])

    respond_to do |format|
      if @short_link
        referrer_uri = URI(request.referer.to_s)
        Click.create(:short_link => @short_link, :referrer_host => referrer_uri.host, :referrer_path => referrer_uri.path)
        format.html { redirect_to(@short_link.full_link) }
      else
        format.html { render :not_found }
      end
    end
  end

  private

  def get_full_link
    @full_link_string = params[:short_link][:full_link]
    if @full_link_string.empty?
      flash[:alert] = "Link can't be empty"
      redirect_to root_path
    end
  end
end

