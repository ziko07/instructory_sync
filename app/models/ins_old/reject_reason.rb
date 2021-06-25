class InsOld::RejectReason < InsOld::Base
  self.table_name = "reject_reason"
  def self.create_new_reject_reason
    InsNew::CourseRejectReason.delete_all
    InsOld::RejectReason.all.each do |reason|
      reason.sync_item
    end
  end

  def sync_item
    new_reject = {
      id: self.id,
      course_id: self.course_id,
      reason: self.reason,
      user_id: self.reject_by,
      created_at: self.updated_at ,
      updated_at: self.updated_at
    }
    InsNew::CourseRejectReason.create(new_reject)
  end
end