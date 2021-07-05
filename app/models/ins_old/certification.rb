class InsOld::Certification < InsOld::Base
  def self.create_new_certification
    InsNew::Certification.delete_all
    InsOld::Certification.all.each do |certification|
      certification.sync_item
    end
  end

  def sync_item
    if self.status
      new_certification = {
        id: self.id,
        user_id: self.users_id,
        subject: self.subject,
        institution: self.institution,
        passing_year: self.passing_year
      }
      InsNew::Certification.create!(new_certification)
    end
  end
end
