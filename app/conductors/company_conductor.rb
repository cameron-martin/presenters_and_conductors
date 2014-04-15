class CompanyConductor < ActionConductor::Base
  conduct :company do |company|
    company.name
    company.phone
    company.website
  end
  
  conduct :credit_card do |credit_card|
    credit_card.owner_name :as => :card_holder_name
    credit_card.provider :as => :credit_card_provider
    credit_card.number :as => :credit_card_number
    credit_card.expiry_month
    credit_card.expiry_year
  end
    
  conduct_attribute :uploaded_data
  
  owner :company
  
  def credit_card
    @credit_card ||= (self.company.credit_card || self.company.credit_card = CreditCard.new)
  end
  
  def avatar
    @avatar ||= (self.company.avatar || Avatar.new)
  end
  
  def uploaded_data=(data)
    unless data.blank?
      self.avatar.uploaded_data = data
      @avatar_present = true
    end
  end
  
  def save
    if @avatar_present
      company.avatar = avatar if avatar.new_record?
      avatar.save
    end
    company.save && credit_card.save
  end
  
  def errors
    method_map = @reversed_method_mappings
    
    errors = ActiveRecord::Errors.new(self)
    errors.add_conductor_errors_for(company, method_map)
    errors.add_conductor_errors_for(credit_card, method_map)
    errors
  end
end