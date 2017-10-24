class Election < ApplicationRecord
  def start_at
    init.strftime("%m/%d/%Y %H:%M:%S")
  end
  def finish_at
    finish.strftime("%m/%d/%Y %H:%M:%S")
  end
end
