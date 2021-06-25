class InsOld::Message < InsOld::Base
  def self.create_new_message
    InsNew::Conversation.delete_all
    InsOld::Message.all.each do |message|
      message.sync_item
    end
  end

  def sync_item
    conversation = {
      id: self.id,
      user_one: self.from,
      user_two: self.to,
      last_message: self.last_message, #TODO: Change datatype
      status_one: 0,  #TODO: Need to check
      status_two: 0, #TODO: Need to check
      created_at: DateTime.now,
      updated_at: DateTime.now
    }
    InsNew::Conversation.create(conversation)
  end
end