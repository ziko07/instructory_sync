class InsOld::Category < InsOld::Base
  self.table_name = "category"
  def self.create_new_course_category
    InsNew::CourseCategory.delete_all
    InsOld::Category.all.each do |category|
      category.sync_item
    end
  end

  def sync_item
    new_category = {
      id: self.id,
      name: self.name,
      category_url: self.caturl,
      thumbnail: self.thumbnail,
      order_by: self.orderby,
      status: self.status,
      created_at: DateTime.now,
      updated_at: DateTime.now,
      deleted_at: ''
    }
  InsNew::CourseCategory.create(new_category)
  end
end