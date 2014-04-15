module ActionConductor
  class Base
    class << self
      def owner(owner_name)
        instance_eval("alias_method :#{owner_name}, :owner_object")
      end
  
      def conduct(object_name)
        self.method_mappings.current_object = object_name
        yield self.method_mappings
      end
  
      def conduct_attribute(attribute_name)
        self.method_mappings.add_delegator(attribute_name)
      end
  
      def method_mappings
        @method_mappings ||= MethodMapping.new
      end
      
      def human_attribute_name(attr_name)
        attr_name.humanize
      end
    end
  
  
    def initialize(owner_object, params = {})
      @owner_object = owner_object
    
      @method_mappings = self.class.method_mappings.methods
      @reversed_method_mappings = self.class.method_mappings.reversed_methods
        
      params.each_pair do |attribute, value| 
        method_map = @method_mappings[attribute.to_sym]
        if method_map
          if method_map[:object]
            conductor_object = instance_eval("self.#{method_map[:object]}")
            conductor_object.send("#{method_map[:model_method]}=", value)
          else
            self.send("#{method_map[:model_method]}=", value)
          end
        end
      end unless params.empty?
    end
    attr_reader :owner_object
  

  
    def method_missing(attribute)
      method_map = @method_mappings[attribute.to_sym]
    
      if method_map
        if method_map[:object]
          conductor_object = instance_eval("self.#{method_map[:object]}")
          conductor_object.send(method_map[:model_method])
        else
          self.send(method_map[:model_method])
        end
      else
        super
      end
    end
  
    def logger
      RAILS_DEFAULT_LOGGER
    end
  end
end
