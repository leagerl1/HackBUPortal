class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_and_belongs_to_many :projects
    has_and_belongs_to_many :skills
    has_many :notifications
    
    has_attached_file :avatar, styles: { medium: "225x225>", thumb: "100x100>" }, default_url: "/images/logo.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    
    validates_presence_of :name
    validates_presence_of :last_name
    
    def owned_projects
      Project.where(:owner_id => self.id)
    end
    
end
