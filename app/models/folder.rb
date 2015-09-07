class Folder < ActiveRecord::Base
    belongs_to :user
    has_many :imagefolders
    has_many :images, through: :imagefolders
end
