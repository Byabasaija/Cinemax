class VotesController < ApplicationController
  # before_action :set_post

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_to articles_path, notice: 'Upvoted'
    else
      redirect_to articles_path, alert: 'Failed'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to articles_path, notice: 'Downvoted'
    else
      redirect_to articles_path, alert: 'Failed'
    end
  end

  def vote_count; end
end
