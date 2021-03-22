module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validations
      @validations || []
    end

    def validate(name, type, *options, **hash)
      @validations ||= []
      @validations << { attr: name, type: type, options: options, message: hash }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get("@#{validation[:attr]}")

        send("validate_#{validation[:type]}", value, *validation[:options], **validation[:message])
      end
    end

    def validate_presence(value, **message)
      error_message = message[:message] || 'Значение не заполнено'

      raise error_message if value.nil? || value.empty?
    end

    def validate_format(value, *options, **message)
      error_message = message[:message] || 'number does not match the format'
      raise error_message if value !~ options[0]
    end

    def validate_type(value, *options, **message)
      error_message = message[:message] || 'invalid class type'
      raise error_message unless value.is_a? Object.const_get(options[0].to_s)
    end
  end
end
