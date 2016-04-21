class Pill < ActiveRecord::Base
  mount_uploader :image_path, ImageUploader

  belongs_to :user

  enum :week => [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  enum :time => [:morning, :lunch, :dinner]

  TIME = %w(morning lunch dinner)
  WEEK = [['sunday', 'Sunday'], ['monday', 'Monday'], ['tuesday', 'Tuesday'], ['wednesday', 'Wednesday'], ['thursday', 'Thursday'], ['friday', 'Friday'], ['saturday', 'Saturday']]
end
