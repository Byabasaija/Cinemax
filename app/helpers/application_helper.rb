module ApplicationHelper
  def upvote_or_downvote(article)
    upvoted = Vote.find_by(article: article, user: current_user)
    if upvoted
      link_to('Downvote!', article_vote_path(id: upvoted.id, article_id: article.id), method: :delete, class:"article-title")
    else
      link_to('Upvote!', article_votes_path(article_id: article.id), method: :post, class:"article-title")
    end
  end

  def login_logout
    if user_signed_in?
      link_to('Logout', current_user, method: :delete, class: 'btn btn-outline-danger')
    else
      link_to('Login|Register', new_user_path, class: 'btn btn-outline-primary')
    end
  end
end
