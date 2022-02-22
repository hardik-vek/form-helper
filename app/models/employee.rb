# frozen_string_literal: true
class Employee < ApplicationRecord
  validates :employee_name, :email, :password, :address, :gender, :hobbies, :birth_date, presence: true
  validates :email, uniqueness: true
  validates :employee_name, length: { minimum: 2, maximum: 100 }
  validates :mobile_number, length: { is: 10 }
  validates :address, length: { minimum: 10, maximum: 300 }
  has_many :emp_addresses, dependent: :destroy
  accepts_nested_attributes_for :emp_addresses
end
