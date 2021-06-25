class InsOld::WithdrawRequest < InsOld::Base
  self.table_name = "withdraw_request"
  def self.create_new_withdraw_request
    InsNew::WithdrawRequest.delete_all
    InsOld::WithdrawRequest.all.each do |withdraw_request|
      withdraw_request.sync_item
    end
  end

  def sync_item
    withdraw_request = {
      id: self.id,
      user_payment_method_id: self.withdraw_method,
      user_id: self.user_id,
      amount: self.amount,
      reject_reason: self.reject_reason,
      status: self.status,
      approved_by: self.approve_by,
      created_at: self.created_at,
      updated_at: self.updated_at
    }
    InsNew::WithdrawRequest.create(withdraw_request)
  end
end