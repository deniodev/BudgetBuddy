class Category < ApplicationRecord
  belongs_to :user

  has_many :payments, dependent: :destroy
  has_many :items, through: :payments

  validates :name, :icon, presence: true

  ICONS = {
    'fa-house-user' => 'Housing',
    'fa-bus' => 'Transportation',
    'fa-utensils' => 'Food',
    'fa-lightbulb' => 'Utilities',
    'fa-hand-holding-heart' => 'Insurance',
    'fa-suitcase-medical' => 'Medical',
    'fa-piggy-bank' => 'Saving'
  }.freeze

  def total_amount
    items.sum(:amount)
  end
end
