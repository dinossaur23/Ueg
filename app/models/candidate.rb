class Candidate < ApplicationRecord
  belongs_to :position
  belongs_to :uev
  mount_uploader :image, AttachmentUploader
end
