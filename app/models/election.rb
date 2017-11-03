class Election < ApplicationRecord
  def start_at
    init.strftime("%d/%m/%Y %H:%M:%S")
  end
  def finish_at
    finish.strftime("%d/%m/%Y %H:%M:%S")
  end
end
