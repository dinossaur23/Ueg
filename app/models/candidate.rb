class Candidate < ApplicationRecord
  belongs_to :position
  belongs_to :uev
  belongs_to :election
  has_many :votes
  mount_uploader :image, AttachmentUploader
end
