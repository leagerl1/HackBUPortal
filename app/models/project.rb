class Project < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :skills
    
    accepts_nested_attributes_for :skills
   
    validates_presence_of :name
    validates_presence_of :description
    validates_uniqueness_of :name
    
    
    def owner
      User.find(self.owner_id)
    end
    
end
