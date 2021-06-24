class InsOld::CourseSection < InsOld::Base
  self.table_name = "course_section"
  def self.create_new_course_section
    InsOld::CourseSection.all.each do |section|
      section.sync_item
    end
  end

  def sync_item
    new_category = {
      id: self.id,
      name: self.name,
      course_id: self.course_id,
      details: self.details,
      serial: self.order,
      created_at: DateTime.now,
      updated_at: DateTime.now,
      deleted_at: ''
    }
    InsNew::CourseSection.create(new_category)
  end
end