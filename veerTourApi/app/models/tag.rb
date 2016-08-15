class Tag < ActiveRecord::Base
   belongs_to :categorie
   has_many  :videos
   attr_accessible :id, :name
end
