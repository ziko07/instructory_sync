class InsOld::Newsfeed < InsOld::Base
  self.ignored_columns = %w[type]
  def self.create_new_newsfeed
    InsNew::Newsfeed.delete_all
    InsOld::Newsfeed.all.each do |feed|
      feed.sync_item
    end
  end

  def sync_item
    new_feed = {
      id: self.id,
      course_id: self.course_id,
      news_text: self.newstext,
      user_id: self.user_id,
      image: self.imgsrc,
      created_at: self.postdate ,
      updated_at: self.modifydate
    }
    InsNew::Newsfeed.create(new_feed)
  end
end