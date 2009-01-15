module ActiveRecord
  
  module Reflection
    class AssociationReflection
      def null_object
        options[:null_object]
      end
    end
  end
  
  module Associations
    module ClassMethods
      
      def create_has_one_reflection_with_null_object(association_id, options)
        null_object = options.delete(:null_object)
        reflection = create_has_one_reflection_without_null_object(association_id, options)
        reflection.options[:null_object] = null_object if null_object
        reflection
      end
      alias_method_chain :create_has_one_reflection, :null_object
      
      def create_belongs_to_reflection_with_null_object(association_id, options)
        null_object = options.delete(:null_object)
        reflection = create_belongs_to_reflection_without_null_object(association_id, options)
        reflection.options[:null_object] = null_object if null_object
        reflection
      end
      alias_method_chain :create_belongs_to_reflection, :null_object
      
      def association_accessor_methods_with_null_object(reflection, association_proxy_class)
        association_accessor_methods_without_null_object(reflection, association_proxy_class)
        if reflection.null_object
          define_method("#{reflection.name}_with_null_object") do |*params|
            association = send("#{reflection.name}_without_null_object".to_sym)
            association || reflection.null_object
          end
          alias_method_chain reflection.name, :null_object
        end
      end
      alias_method_chain :association_accessor_methods, :null_object
      
    end
  end
  
end