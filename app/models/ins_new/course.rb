class InsNew::Course < InsNew::Base
  has_many :course_ratings, :class_name => 'InsNew::CourseRating', foreign_key: :course_id
  before_create :check_course_url

  def check_course_url
    course = InsNew::Course.where(course_url: self.course_url)
    if course.present?
      self.course_url = self.course_url + "-#{self.id}"
    end
  end
end