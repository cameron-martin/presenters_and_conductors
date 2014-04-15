module ActionConductor
  class MethodMappedError < ArgumentError
  end
  
  class MethodMapping
    def initialize
      @methods = {}
      @reversed_methods = {}
    end
    attr_reader :methods, :reversed_methods
    # Holds the current object that is being processed.
    attr_accessor :current_object

    def add_delegator(attribute_name)
      @methods[attribute_name] = {:model_method => attribute_name}
    end

    def method_missing(model_value, *args)
      options = args.first
      conductor_value = options && options[:as] || model_value
      
      raise MethodMappedError, "#{conductor_value} has already been mapped." if @methods.has_key?(conductor_value)
      
      @methods[conductor_value] = {:object => self.current_object, :model_method => model_value}
      @reversed_methods[model_value] = conductor_value
    end
  end
end
