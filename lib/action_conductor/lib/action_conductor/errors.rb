module ActiveRecord
  class Errors
   def add_conductor_errors_for(record, mapping)
    return if record.valid?
    record.errors.each do |attribute, message|
      self.add(mapping[attribute.to_sym], message)
    end
   end 
  end
end