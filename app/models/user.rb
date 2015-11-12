class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_and_belongs_to_many :projects
    has_and_belongs_to_many :skills
    
    validates_presence_of :name
    validates_presence_of :last_name
    #validates_presence_of :photo
end
