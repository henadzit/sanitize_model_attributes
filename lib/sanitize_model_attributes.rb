require 'sanitize_model_attributes/version'
require 'sanitize_model_attributes/configuration'
require 'loofah'

module SanitizeModelAttributes
  class << self
    def included(base)
      class << base
        include ClassMethods
      end
    end

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

  module ClassMethods
    def sanitize_attributes(*args)
      args.each do |attribute_name|
        self.class_eval do
          define_method "#{attribute_name}=".to_sym do |attribute_value|
            unless attribute_value.frozen?
              attribute_value = Loofah.fragment(attribute_value).scrub!(:strip).text

              SanitizeModelAttributes.configuration.white_character_maps.each do |k, v|
                attribute_value = attribute_value.gsub(/#{k}/, v)
              end
            end

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
