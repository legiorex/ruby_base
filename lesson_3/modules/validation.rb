module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanseMethods
  end

  module ClassMethods
    attr_writer :instances

    def validate(name, _type, *_options)
      validate_type = {format: '!~'}
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      send(name)

      # у нас тут идёт сохранение
    end
  end

  module InstanseMethods

    def valid?
        validate!
        true
      rescue StandardError
        false
      end

    def validate!
        TRAIN_NUMBER_FORMAT = /^[а-я\d]{3}-?[а-я\d]{2}$/i.freeze
      # запуск всех валидаций
      raise 'Поезд должн иметь номер' if number.nil?
      raise 'Не верный формат номера поезда' if number !~ TRAIN_NUMBER_FORMAT
    end
  end
end
