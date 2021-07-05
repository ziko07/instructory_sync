class InsOld::Skill < InsOld::Base
  def self.create_new_skill
    InsNew::Skill.delete_all
    InsOld::Skill.all.each do |skill|
      skill.sync_item
    end
  end

  def sync_item
    if self.status
      new_skill = {
        id: self.id,
        user_id: self.user_id,
        name: self.tag
      }
      InsNew::Skill.create!(new_skill)
    end
  end
end
