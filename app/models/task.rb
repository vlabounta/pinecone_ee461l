class Task < ActiveRecord::Base
  scope :finder, lambda { |q| where("title like :q", q: "%#{q}%") }
  belongs_to :workflow
  has_many :messages, dependent: :destroy

  def as_json(options)
    { id: id, text: title }
  end
end
