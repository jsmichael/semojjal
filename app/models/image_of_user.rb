class ImageOfUser < ActiveRecord::Base
    belongs_to :image
    belongs_to :user
end