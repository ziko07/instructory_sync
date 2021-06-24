class InsOld::CourseTag < InsOld::Base
  def self.create_new_course_tag
    InsOld::CourseTag.all.each do |tag|
      tag.sync_item
    end
  end

  def sync_item
    new_tag = {
      id: self.id,
      tag: self.tag,
      course_id: self.course_id,
      created_at: DateTime.now() ,
      updated_at: DateTime.now()
    }
    InsNew::CourseTag.create(new_tag)
  end
end