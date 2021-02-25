module ApplicationHelper
  def user_signed_in?
    session[:current_user_id] ? true : nil
  end

  def current_user
    User.find(session[:current_user_id])
  end

  def upvote_or_downvote(article)
    upvoted = Vote.find_by(article: article, user: current_user)
    if upvoted
      link_to('Downvote!', article_vote_path(id: upvoted.id, article_id: article.id), method: :delete)
    else
      link_to('Upvote!', article_votes_path(article_id: article.id), method: :post)
    end
  end
end
