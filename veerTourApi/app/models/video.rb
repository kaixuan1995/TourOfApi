class Video < ActiveRecord::Base
   belongs_to :tag
   attr_accessible :id,:name
end
