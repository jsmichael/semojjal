class Imagefolder < ActiveRecord::Base
    belongs_to :image
    belongs_to :folder    
end
