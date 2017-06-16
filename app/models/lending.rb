class Lending < ActiveRecord::Base
  belongs_to :lender
  belongs_to :borrower
  has_many :borrowers, class_name: 'User'
  has_many :lenders, class_name: 'User'
end
