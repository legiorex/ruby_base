module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validations
      @validations || []
    end

    def validate(name, type, *args, **options)
      @validations ||= []
      @validations << { attr: name, type: type, args: args, options: options }
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

        send("validate_#{validation[:type]}", validation[:attr], value, *validation[:args], **validation[:options])
      end
    end

    def validate_presence(attr, value, **options)
      error_message = options[:message] || "Значение #{attr} не заполнено"

      raise error_message if value.nil? || value.empty?
    end

    def validate_format(attr, value, *args, **options)
      error_message = options[:message] || "#{attr} не должно быть пустым"
      raise error_message if value !~ args[0]
    end

    def validate_type(attr, value, *args, **options)
      error_message = options[:message] || "#{attr} invalid class type"
      raise error_message unless value.is_a? Object.const_get(args[0].to_s)
    end
  end
end
