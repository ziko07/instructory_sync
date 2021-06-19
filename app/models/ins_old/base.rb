class InsOld::Base < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :ins_old_app
end
