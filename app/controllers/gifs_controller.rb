class GifsController < ApplicationController

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.create(url: params[:gif][:url], title: params[:gif][:title])
    if @gif.valid?
      @gif.save
      redirect_to root_path, notice: "gif created successfully"
    else
      render "new"
    end
  end

end
