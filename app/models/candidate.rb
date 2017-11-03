class Candidate < ApplicationRecord
  belongs_to :position
  belongs_to :uev
  belongs_to :election
  mount_uploader :image, AttachmentUploader
end
