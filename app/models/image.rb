class Image < ActiveRecord::Base
    
    has_many :image_of_users
    has_many :users, through: :image_of_users
    has_many :imagefolders
    has_many :folders, through: :imagefolders
    
    mount_uploader  :jjalbang, ImageuploaderUploader
    
    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :tagging

end
