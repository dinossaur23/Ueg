class Election < ApplicationRecord
  has_many :votes
  def start_at
    init.strftime("%d/%m/%Y %H:%M:%S")
  end
  def finish_at
    finish.strftime("%d/%m/%Y %H:%M:%S")
  end
end
