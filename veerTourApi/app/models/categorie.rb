class Categorie < ActiveRecord::Base
   has_many :tags
   attr_accessible :id, :name
end
