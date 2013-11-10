class Workflow < ActiveRecord::Base
  belongs_to :user
  belongs_to :new_hire
  has_many :tasks, dependent: :destroy
end
