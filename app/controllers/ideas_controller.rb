class IdeasController < ApplicationController
  before_action :your_page, only: [:index, :new, :show, :destroy]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
    @idea = Idea.new

    @cards = Card.all

    @randoms = Card.order("RANDOM()").limit(2)
    @selected_on_card_one = @ideas.where(["card_one = ? or card_two = ?", @randoms[0].content, @randoms[0].content])
    @selected_on_card_two = @ideas.where(["card_one = ? or card_two = ?", @randoms[1].content, @randoms[1].content])
  end


  def show
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def create
    @ideas = Idea.all
    @idea = Idea.new(idea_params)

    @cards = Card.all
    @randoms = [Card.find_by(content: @idea.card_one), Card.find_by(content: @idea.card_two)]

    @selected_on_card_one = @ideas.where(["card_one = ? or card_two = ?", @randoms[0].content, @randoms[0].content])
    @selected_on_card_two = @ideas.where(["card_one = ? or card_two = ?", @randoms[1].content, @randoms[1].content])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to ideas_path, notice: 'idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render 'index' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:card_one, :card_two, :idea_content)
  end

  def your_page
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
