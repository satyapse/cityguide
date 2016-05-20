class Like < ActiveRecord::Base
 belongs_to :customer
 belongs_to :ptemple

 validates_uniqueness_of :customer, scope: :ptemple
end