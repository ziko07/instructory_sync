class InsNew::Base < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :ins_new_app
end
