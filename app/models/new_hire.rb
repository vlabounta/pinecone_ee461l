class NewHire < ActiveRecord::Base
  has_many :workflows, dependent: :destroy
end
