class ArticleMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def new_article_email
    @article = Article.find params[:article_id]
    @email = params[:email]
    mail(to: @email, subject: @article.title)
  end
end
