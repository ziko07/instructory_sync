class InsOld::PaymentMethod < InsOld::Base
  self.table_name = "payment_mehods"
  def self.create_new_payment_method
    InsNew::UserPaymentMethod.delete_all
    InsOld::PaymentMethod.all.each do |payment_method|
      payment_method.sync_item
    end
  end

  def sync_item
    payment_method = {
      id: self.id,
      payment_method: self.payment_menthod,
      user_id: self.users_id,
      card_name: self.card_name,
      card_number: self.card_number,
      cvv: self.cvv,
      expire_date: self.expire_date,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }
    InsNew::UserPaymentMethod.create(payment_method)
  end
end