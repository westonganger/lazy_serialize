require 'json'
require 'yaml'

module LazySerialize
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    def lazy_serialize(attr, klass)
      if klass == Hash
        define_method "#{attr}=" do |val|
          raise('Incorrect Type Passed, should have been a Hash') unless val.is_a?(Hash)
          write_attribute(attr, val.to_s) 
          instance_variable_set("@#{attr}", val)
        end

        define_method attr do
          val = instance_variable_get("@#{attr}")
          if val.nil?
            if self[attr].blank?
              val = {}
            else
              val = eval(self[attr])
            end
            instance_variable_set("@#{attr}", val)
          end
          return val
        end

      elsif defined?(HashWithIndifferentAccess) && klass == HashWithIndifferentAccess
        define_method "#{attr}=" do |val|
          raise('Incorrect Type Passed, should have been a Hash') unless val.is_a?(Hash)
          write_attribute(attr, val.to_s) 
          instance_variable_set("@#{attr}", val)
        end

        define_method attr do
          val = instance_variable_get("@#{attr}")
          if val.nil?
            if self[attr].blank?
              val = {}
            else
              val = eval(self[attr])
            end
            val = val.with_indifferent_access
            instance_variable_set("@#{attr}", val)
          end
          return val
        end

      elsif klass == Array
        define_method "#{attr}=" do |val|
          raise('Incorrect Type Passed, should have been a Array') unless val.is_a?(Array)
          write_attribute(attr, val.to_s) 
          instance_variable_set("@#{attr}", val)
        end

        define_method attr do
          val = instance_variable_get("@#{attr}")
          if val.nil?
            if self[attr].blank?
              val = []
            else
              val = eval(self[attr])
            end
            instance_variable_set("@#{attr}", val)
          end
          return val
        end

      elsif klass == 'JSON'
        define_method "#{attr}=" do |val|
          raise('Incorrect Type Passed, should have been a Hash') unless val.is_a?(Hash)
          write_attribute(attr, JSON.generate(val)) 
          instance_variable_set("@#{attr}", val)
        end

        define_method attr do
          val = instance_variable_get("@#{attr}")
          if val.nil?
            if self[attr].blank?
              val = {}
            else
              val = JSON.load(self[attr])
            end
            instance_variable_set("@#{attr}", val)
          end
          return val
        end

      elsif klass == YAML
        define_method "#{attr}=" do |val|
          raise('Incorrect Type Passed, should have been a Hash') unless val.is_a?(Hash)
          write_attribute(attr, val.to_yaml)
          instance_variable_set("@#{attr}", val)
        end

        define_method attr do
          val = instance_variable_get("@#{attr}")
          if val.nil?
            if self[attr].blank?
              val = {}
            else
              val = YAML.load(self[attr])
            end
            instance_variable_set("@#{attr}", val)
          end
          return val
        end

      else
        raise('LazySerialize only supports Hash, HashWithIndifferentAccess, Array, JSON, and YAML')
      end

    end
  end

end
