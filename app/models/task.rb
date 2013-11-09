class Task < ActiveRecord::Base
  belongs_to :workflow
  has_many :messages, dependent: :destroy
end
