class InsOld::MessageConversation < InsOld::Base
  self.table_name = "message_conversation"
  def self.create_new_message_conversation
    InsNew::Message.delete_all
    InsOld::MessageConversation.all.each do |message|
      message.sync_item
    end
  end

  def sync_item
    conversation = {
      id: self.id,
      conversation_id: self.msg_id,
      user_id: self.sender_id,
      message: self.message, #TODO: Change datatype
      created_at: self.send_time,
      updated_at: self.send_time
    }
    InsNew::Message.create(conversation)
  end
end