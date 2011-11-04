class ShortLinkController < ApplicationController
  def new
    @short_link = ShortLink.new
  end

  def create
    full_link_string = params[:short_link][:full_link]
    @short_link = ShortLink.find_or_initialize_by_full_link(full_link_string)
    if @short_link.save
      redirect_to(show_short_link_path(@short_link.short_code))
    else
      render
    end
  end

  def show
    @short_link = ShortLink.find_by_short_code(params[:short_code])

    respond_to do |format|
      if @short_link
        format.html { @short_link }
      end
    end
  end

  def access
    @short_link = ShortLink.find_by_short_code(params[:short_code])
    if @short_link
      redirect_to(@short_link.full_link)
    end
  end

end

