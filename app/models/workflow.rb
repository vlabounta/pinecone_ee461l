class Workflow < ActiveRecord::Base
  belongs_to :user
  belongs_to :new_hire
  has_many :tasks, dependent: :destroy

  # the email of the new hire to assign to
  attr_accessor :goon_email
end
