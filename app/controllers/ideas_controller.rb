class IdeasController < ApplicationController
  def index
    @cards = Card.all
    @randoms = Card.order("RANDOM()").limit(2)

    @ideas = Idea.all
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    respond_to do |format|
      if @idea.save
        format.html { redirect_to ideas_path }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def idea_params
    params.require(:idea).permit(:card_one, :card_two, :idea_content)
  end
end
