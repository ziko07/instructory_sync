class InsOld::Course < InsOld::Base
  attribute :privacy, ActiveRecord::Type::Integer.new
  attribute :coursefor, ActiveRecord::Type::Integer.new

  def self.create_new_course
    InsNew::Course.delete_all
    InsOld::Course.all.each do |course|
      course.sync_item
    end
  end

  def sync_item
    new_course = {
      id: self.id,
      course_category_id: self.category_id,
      user_id: self.user_id,
      title: self.title,
      description: self.description,
      price: self.price,
      thumbnail: self.course_thumb,
      privacy: self.privacy,
      approval: self.approval,
      currency_id: self.curncyid,
      language_locale_id: self.language,
      duration: self.duration,
      course_url: self.courseurl,
      features: self.whatlearn,
      course_model: self.course_type,
      view_count: self.view_count,
      share_count: 0,
      avg_rating: 0,
      difficulty_level: self.coursefor,
      created_at: self.submitdate,
      updated_at: self.updated_at,
      deleted_at: '',

    }
    crs = InsNew::Course.create(new_course)
  end
end