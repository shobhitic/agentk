class ArticleMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def new_article_email
    @article = Article.find params[:article_id]
    @subscriber = Subscriber.find params[:subscriber_id]
    @email = @subscriber.email
    mail(to: @email, subject: @article.title)
  end
end
