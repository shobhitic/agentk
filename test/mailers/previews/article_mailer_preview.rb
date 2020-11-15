# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview
  def new_article_email
    ArticleMailer.with(article_id: Article.first.id, subscriber_id: Subscriber.last.id).new_article_email
  end
end
