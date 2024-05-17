class WaitAndMakeJob < ApplicationJob
  queue_as :default

  def perform(master, user)
    master.feedbacks.create!(comment: 'Привет!', master_id: master.id, user_id: user.id)
    Rails.logger.info("\e[1;33mWAKE AND MAKE JOB\e[0m")
  end
end
