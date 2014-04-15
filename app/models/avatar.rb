class Avatar < ActiveRecord::Base
  belongs_to :company
  
  has_attachment :storage => :file_system, :thumbnails => { :thumb => [50, 50]}
end
