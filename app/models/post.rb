class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  acts_as_url :title, :url_attribute => :slug

  before_save :update_published_date

  default_scope order('published_at desc')

  def to_param
    slug
  end

  def external?
    url.present?
  end

  def has_more_tag
    content =~ /<!--\s*more\s*-->/i ? true : false
  end

  def excerpt
    if content.index(/<!--\s*more\s*-->/i)
      content.split(/<!--\s*more\s*-->/i)[0]
    else
      content
    end
  end

  private
    def update_published_date
      if self.draft_changed? and self.draft == false and not self.published_at
        self.published_at = DateTime.current
      end
    end
end
