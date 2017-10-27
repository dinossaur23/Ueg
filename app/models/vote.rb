class Vote < ApplicationRecord
  has_one :uev
  has_one :voter
  has_one :candidate
  has_one :election
end
