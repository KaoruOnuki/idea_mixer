class LikesController < ApplicationController
  def create
    like = current_user.likes.create(idea_id: params[:idea_id])
    redirect_to like.idea, notice: "#{like.idea.user.name}さんのidea_contentをイイネした"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to like.idea, notice: "#{like.idea.user.name}さんのイイネを解除した"
  end
end
