class InsOld::CourseSubcategory < InsOld::Base
  self.table_name = "course_subcategory"
  def self.create_new_course_course_subcategory
    InsNew::CourseCourseSubcategory.delete_all
    InsOld::CourseSubcategory.all.each do |sub_cat|
      sub_cat.sync_item
    end
  end

  def sync_item
    new_subcategory = {
      id: self.id,
      course_subcategory_id: self.subcat_id,
      course_id: self.course_id
    }
    InsNew::CourseCourseSubcategory.create(new_subcategory)
  end
end