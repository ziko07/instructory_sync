# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# InsNew::Course.all.each do |cr|
#   avg_rating = (cr.course_ratings.sum(:star) / cr.course_ratings.count) if cr.course_ratings.count > 0
#   cr.avg_rating = avg_rating.round(2) if avg_rating.present?
#   cr.save
# end

# InsNew::User.update_all(user_type: 0)
# InsNew::User.all.each do |user|
#   purchased = InsNew::CourseSaleDetail.where(status: 1, user_id: user.id).count
#   course_ids = InsNew::Course.where(user_id: user.id).ids
#   enrolled = course_ids.length > 0 ? InsNew::CourseSaleDetail.where(status: 1, course_id: course_ids).count : 0
#   p 'purchased#enrolled'
#   p purchased
#   p enrolled
#   user.update(total_purchased: purchased, total_enrollments: enrolled)
# c = InsNew::Course.where(user_id: user.id).count
# p c
# if c > 0
#   user.update!(user_type: 2)
# elsif user.total_purchased > 0
#   user.update!(user_type: 1)
# end
# end