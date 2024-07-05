# app/models/transaction.rb
class Transaction < ApplicationRecord
  # Replace with your actual attributes and associations
  belongs_to :user
  validates :description, presence: true
end
