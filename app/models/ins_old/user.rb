class InsOld::User < InsOld::Base
  attribute :user_type, ActiveRecord::Type::Integer.new
  def self.create_new_user
      InsNew::User.delete_all
      InsOld::User.all.each do |user|
        new_user = InsNew::User.where('email =  ? OR user_name = ?', user.email, user.username)
        unless new_user.present?
          user.sync_item
        end
      end
  end


  def sync_item
    new_user = {
      id: self.id,
      user_name: self.username,
      email: self.email,
      gender: self.gender ,
      contact_no: self.contact_no || '',
      password: self.password,
      job_title: self.job_title,
      biography: self.biography,
      country_id: self.location.to_i,
      city_id: self.city.to_i,
      website: self.website,
      name: "#{self.firstname} #{self.lastname}",
      facebook_id: self.facebook_id,
      twitter_id: self.twitter_id,
      profile_photo: self.profile_photo,
      total_earnings: self.total_earnings,
      current_balance: self.current_balance,
      total_withdrawal_amount: self.withdrawal_amount,
      security_question: self.security_question,
      security_answer: self.security_answer,
      notification: self.notification,
      instructor_level: 0,
      max_rating: 0,
      user_type: self.role_id,
      affiliator_status: 0,
      total_enrollments: 0,
      total_purchased: 0,
      status: self.status,
      remember_token: '',
      created_at: self.create_date,
      updated_at: self.update_date,
      email_verified_at: self.create_date
    }
    InsNew::User.create(new_user)
  end

end