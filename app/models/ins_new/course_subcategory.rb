class InsNew::CourseSubcategory < InsNew::Base
  before_create :check_subcategory_url

  def check_subcategory_url
    subcategory = InsNew::CourseSubcategory.where(subcategory_url: self.subcategory_url)
    if subcategory.present?
      self.subcategory_url = self.subcategory_url + "-#{self.id}"
    end
  end
end