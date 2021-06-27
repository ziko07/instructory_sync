class InsOld::CourseLesson < InsOld::Base
  def self.create_new_course_lesson
    InsNew::CourseLesson.delete_all
    InsOld::CourseLesson.all.each do |lesson|
      lesson.sync_item
    end
  end

  def sync_item
    new_lesson = {
      id: self.id,
      title: self.title,
      course_id: self.courses_id,
      description: self.description,
      video_url: self.vimeo_url,
      thumbnail: self.thumbnail ,
      privacy: self.privacy ,
      course_section_id: self.section_id ,
      duration: self.duration ,
      serial: self.orderby ,
      approval: self.approval.present? ? self.approval : 1 ,
      status: true,
      created_at: DateTime.now,
      updated_at: DateTime.now,
      deleted_at: ''
    }
    InsNew::CourseLesson.create(new_lesson)
  end
end