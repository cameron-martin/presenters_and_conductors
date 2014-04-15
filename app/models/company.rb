class Company < ActiveRecord::Base
  has_one :avatar
  has_one :credit_card
  
  validates_presence_of :name, :phone, :website
end
