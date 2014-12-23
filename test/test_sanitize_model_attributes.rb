require 'minitest/autorun'
require 'sanitize_model_attributes'

class TestString < Minitest::Test
  def setup
    @klass = Class.new
    @klass.include SanitizeModelAttributes
    @klass.class_eval do
      sanitize_attributes :name
      sanitize_model_attributes :model_name
    end
  end

  def test_to_respond
    assert @klass.respond_to? :sanitize_attributes
    assert @klass.respond_to? :sanitize_model_attributes

    instance = @klass.new

    assert instance.respond_to? :name=
    assert instance.respond_to? :model_name=
  end

  def test_to_run
    instance = @klass.new

    def instance.write_attribute(name, value)
      instance_variable_set("@#{name}".to_sym, value)
    end

    instance.name = '<strong>hogehoge</strong>'
    assert_equal 'hogehoge', instance.instance_variable_get(:@name)
  end

  def test_to_skip_frozen_string
    instance = @klass.new

    def instance.write_attribute(name, value)
      instance_variable_set("@#{name}".to_sym, value)
    end

    instance.name = '<strong>hogehoge</strong>'.freeze
    assert_equal '<strong>hogehoge</strong>', instance.instance_variable_get(:@name)
  end
end
