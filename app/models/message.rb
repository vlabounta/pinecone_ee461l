class Message < ActiveRecord::Base
  serialize :to,Array
end
