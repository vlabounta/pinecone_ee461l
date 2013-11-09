class Message < ActiveRecord::Base
  belongs_to :task
  serialize :to,Array
end
