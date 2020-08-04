class Api::MemesController < ApplicationController

  def index
    @memes = Meme.all
    render 'index.json.jb'
  end

  def show
    @meme = Meme.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @meme = Meme.new(
      top: params[:top],
      bottom: params[:bottom],
      image: params[:image]
      )
    if @meme.save
      render 'show.json.jb'
    else
      render json: {errors: @meme.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    the_id = params[:id]
    @meme = Meme.find_by(id: the_id)
    @meme.top = params[:top] || @meme.top
    @meme.bottom = params[:bottom] || @meme.bottom
    @meme.image = params[:image] || @meme.image

    if @meme.save
      render 'show.json.jb'
    else
      render json: {errors: @meme.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
end
