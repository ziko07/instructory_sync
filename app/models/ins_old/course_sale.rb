class InsOld::CourseSale < InsOld::Base
  def self.create_new_sale
    InsNew::CourseSale.delete_all
    InsOld::CourseSale.all.each do |course_sale|
      payment_ssl_post = InsOld::PaymentSslPost.where(transid: course_sale.transno).first
      new_course_sale = InsNew::CourseSale.find_by_transaction_id(course_sale.transno)
      unless new_course_sale.present?
        course_sale.sync_item(payment_ssl_post)
      end
    end
  end

  def sync_item(payment_ssl_post)
    new_course_sale = {
      id: id,
      user_id: users_id,
      store_id:  payment_ssl_post.present? ? payment_ssl_post.storeid : '',
      transaction_id:  transno,
      payment_method:  2,
      currency_id:  paycurrency,
      subtotal_amount:  subtotalamount,
      discount_amount:  discountamount,
      service_charge:  servicecharge,
      net_amount:  netpayable,
      customer_name:  payment_ssl_post.present? ? payment_ssl_post.customername : '',
      customer_email:  payment_ssl_post.present? ? payment_ssl_post.custemail || '' : '',
      customer_phone:  payment_ssl_post.present? ?  payment_ssl_post.custphone || '' : '',
      cart_info:  payment_ssl_post.present? ? payment_ssl_post.cartinfo : '',
      ipn_response:  payment_ssl_post.present? ? payment_ssl_post.ipn_response : '',
      payment_status:  status,
      created_at:  trans_date,
      updated_at:  trans_date,
    }
    InsNew::CourseSale.create(new_course_sale)
  end
end
