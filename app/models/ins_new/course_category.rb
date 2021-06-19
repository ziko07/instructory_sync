class InsNew::CourseCategory < InsNew::Base
  before_create :check_category_url

  def check_category_url
    subcategory = InsNew::CourseCategory.where(category_url: self.category_url)
    if subcategory.present?
      self.category_url = self.category_url + "-#{self.id}"
    end
  end
end