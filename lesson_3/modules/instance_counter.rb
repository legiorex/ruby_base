module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanseMethods
  end

  module ClassMethods
    attr_writer :instances

    def instances
      @instances || 0
    end
  end

  module InstanseMethods
    def register_instance
      self.class.instances += 1
    end
  end
end
