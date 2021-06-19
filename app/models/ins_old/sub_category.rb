class InsOld::SubCategory < InsOld::Base
  self.table_name = "sub_category"
  def self.create_new_course_sub_category
    InsOld::SubCategory.all.each do |sub_category|
      sub_category.sync_item
    end
  end

  def sync_item
    new_category = {
      id: self.id,
      name: self.name,
      course_category_id: self.category_id,
      subcategory_url: self.scaturl,
      thumbnail: self.thumbnail,
      order_by: self.orderby,
      status: self.status,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }
    p new_category
    new_course = InsNew::CourseSubcategory.create(new_category)
    InsOld::SubCategory.count
    InsNew::CourseSubcategory.count
  end
end