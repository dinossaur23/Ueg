class Voter < ApplicationRecord
  belongs_to :uev
  belongs_to :election
  has_many :votes
end
