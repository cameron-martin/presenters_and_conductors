class CreditCard < ActiveRecord::Base
  belongs_to :company
  
  validates_presence_of :owner_name, :number, :provider, :expiry_month, :expiry_year
  
  def self.supported_providers
    [['Visa', 'visa'], ['Mastercard', 'mastercard']]
  end
end
