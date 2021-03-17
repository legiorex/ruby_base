module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
      define_method("#{name}_history".to_sym) { self.instance_variables.map { |value| instance_variable_get(value) } }
    end
  end
end

class TestClass
  extend Accessors
  attr_accessor_with_history :a, :b, :c
end
