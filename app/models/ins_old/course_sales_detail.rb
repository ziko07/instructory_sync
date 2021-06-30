class InsOld::CourseSalesDetail < InsOld::Base
  self.ignored_columns = %w[duration]
  self.table_name = "course_sales_details"
  belongs_to :course, :class_name => 'InsOld::Course', foreign_key: :courses_id

  def self.create_new_sale_detail
    InsNew::CourseSaleDetail.delete_all
    InsOld::CourseSalesDetail.all.each do |course_sale_detail|
      course_sale = InsOld::CourseSale.where(transno: course_sale_detail.transno).first
      course_sale_detail.sync_item(course_sale)
    end
  end

  def sync_item(course_sale)
    new_course_sale_detail = {
      id: id,
      course_sale_id: course_sale.present? ? course_sale.id : 0,
      user_id: user_id,
      course_id: courses_id,
      currency_id: coursecurr,
      price: courserate,
      discount_percentage: discount_percentage,
      instructor_income: instructor_income,
      ssl_fee: ssl_fee,
      instructory_income: courserate - instructor_income,
      status: status,
      created_at: buydate,
      updated_at: buydate
    }
    InsNew::CourseSaleDetail.create(new_course_sale_detail)
  end

  def instructor_income
    if course && course.course_type == 0
      courserate * 0.15
    elsif course && course.course_type == 1
      courserate * 0.425
    else
      courserate * 0.15
    end
  end

  def ssl_fee
    courserate * 0.02
  end

end