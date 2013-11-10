class NewHire < ActiveRecord::Base
  has_many :workflows, dependent: :destroy
  belongs_to :user
end
