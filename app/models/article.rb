class Article < ApplicationRecord
  validates_uniqueness_of :slug

  before_create :generate_slug
  after_create :schedule_to_send

  def generate_slug
    self.slug = self.title.parameterize
  end

  def schedule_to_send
    ArticleMailer.with(article_id: self.id, email: 'example@mail.com').new_article_email.deliver_later
  end
end
