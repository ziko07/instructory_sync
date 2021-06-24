class InsOld::CourseRating < InsOld::Base
  def self.create_new_course_rating
    InsOld::CourseRating.all.each do |rating|
      rating.sync_item
    end
  end

  def sync_item
    new_rating = {
      id: self.id,
      user_id: self.users_id,
      course_id: self.courses_id,
      star: self.give_star,
      comment: self.comment,
      created_at: self.commentDate ,
      updated_at: self.commentDate
    }
    InsNew::CourseRating.create(new_rating)
  end
end