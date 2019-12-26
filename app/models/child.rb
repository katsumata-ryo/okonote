class Child < ApplicationRecord
  belongs_to :account

  validates :name, presence: true
  validates :birthday, presence: true
end
