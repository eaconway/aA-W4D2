# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#
class CatRentalRequest < ApplicationRecord
  STATUS_VALUES = %w(PENDING APPROVED DENIED)
  
  validates :cat_id, :start_date, :end_date, presence: true
  
  validates :status, inclusion: { in: STATUS_VALUES,
   message: "Not valid status option" }
   
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
  
end
