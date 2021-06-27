class InsNew::User < InsNew::Base
  def self.load_data
    InsOld::User.create_new_user
    InsOld::Category.create_new_course_category
    InsOld::SubCategory.create_new_course_sub_category
    InsOld::CourseSubcategory.create_new_course_course_subcategory
    InsOld::Course.create_new_course
    InsOld::CourseLesson.create_new_course_lesson
    InsOld::CourseRating.create_new_course_rating
    InsOld::CourseSection.create_new_course_section
    InsOld::CourseTag.create_new_course_tag
    InsOld::CourseSale.create_new_sale
    InsOld::CourseSalesDetail.create_new_sale_detail
    InsOld::Message.create_new_message
    InsOld::MessageConversation.create_new_message_conversation
    InsOld::PaymentMethod.create_new_payment_method
    InsOld::RejectReason.create_new_reject_reason
    InsOld::WithdrawRequest.create_new_withdraw_request
  end
end