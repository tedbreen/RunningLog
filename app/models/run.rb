# == Schema Information
#
# Table name: runs
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  start_time  :time             not null
#  run_type    :integer          not null
#  city        :string(255)      not null
#  state       :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  duration    :float
#  start_date  :date             not null
#  title       :string(255)      not null
#  distance    :float            not null
#  description :text             not null
#

class Run < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :start_date, :presence => true
  validates :run_type, :presence => true
  validates :distance, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :description, :presence => true

  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :user_id,
    :inverse_of => :runs
  )

end
