class InsOld::CourseLesson < InsOld::Base
  attribute :privacy, ActiveRecord::Type::Integer.new
  def self.create_new_course_lesson
    InsNew::CourseLesson.delete_all
    InsOld::CourseLesson.all.each do |lesson|
      lesson.sync_item
    end
  end

  def sync_item
    old_course =  InsOld::Course.find_by_id  self.courses_id
    privecy_value = old_course.present? ? old_course.privacy : 1
    new_lesson = {
      id: self.id,
      title: self.title,
      course_id: self.courses_id,
      description: self.description,
      video_url: (self.vimeo_url.split('/').last if self.vimeo_url.present?),
      thumbnail: self.thumbnail ,
      course_section_id: self.section_id ,
      duration: self.duration ,
      serial: self.orderby || 0 ,
      privacy: privecy_value == 1 ? 0 : 1,
      approval:  self.status,
      status: true,
      created_at: DateTime.now,
      updated_at: DateTime.now,
      deleted_at: ''
    }
    InsNew::CourseLesson.create(new_lesson)
  end
end