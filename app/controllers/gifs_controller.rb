class GifsController < ApplicationController

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.create(url: params[:gif][:url], title: params[:gif][:title])
    @gif.save if @gif.valid?
    redirect_to root_path, notice: "gif created successfully"
  end

end
