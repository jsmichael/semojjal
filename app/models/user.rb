class User < ActiveRecord::Base
  acts_as_tagger
  
  has_many :image_of_users
  has_many :images, through: :image_of_users  
  has_many :folders
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
