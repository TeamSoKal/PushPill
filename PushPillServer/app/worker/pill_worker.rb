class PillWorker
  include Sidekiq::Worker
  def perform()
    Pill.all.each do |pill|
      pill.checked = false
      pill.save!
    end
  end
end

class PatientPillWorker
  include Sidekiq::Worker
  def perform()
    User.all.each do |user|
      checked = true
      user.pills.each do |pill|
        checked = false if pill.checked.eql?(false)
      end
      user.checked = checked
      user.save!
    end
  end
end

class PatientPushWorker
  include Sidekiq::Worker
  def perform()
    User.all.each do |user|
      n = Rpush::Apns::Notification.new
      n.app = Rpush::Apns::App.find_by_name("ios_app")
      n.device_token = user.device_token
      n.alert = 'You have to take medication.'
      n.save!
      render json: {}
    end
  end
end

Sidekiq::Cron::Job.create(name: 'Pill init worker', cron: '* 9,12,19 * * *', class: 'PillWorker')
Sidekiq::Cron::Job.create(name: 'Push worker', cron: '* 9,12,19 * * *', class: 'PatientPushWorker')
Sidekiq::Cron::Job.create(name: 'Patient check init worker', cron: '30 9,12,19 * * *', class: 'PatientPillWorker')