class Attachment < ApplicationRecord
   belongs_to :message, optional: true

   mount_uploader :name, ImageUploader
end
