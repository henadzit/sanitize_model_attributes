require 'sanitize_model_attributes/version'
require 'sanitize'

module SanitizeModelAttributes
  def self.included(base)
    class << base
      include ClassMethods
    end
  end

  module ClassMethods
    def sanitize_attributes(*args)
      args.each do |attribute_name|
        self.class_eval do
          define_method "#{attribute_name}=".to_sym do |attribute_value|
            attribute_value = Sanitize.fragment(attribute_value) unless attribute_value.frozen?
            write_attribute attribute_name.to_sym, attribute_value
          end
        end
      end
    end

    def sanitize_model_attributes(*args)
      sanitize_attributes(*args)
    end
  end
end
