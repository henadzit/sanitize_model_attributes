require 'minitest/autorun'
require 'sanitize_model_attributes'

class TestString < Minitest::Test
  def test_to_respond
    klass = Class.new
    klass.include SanitizeModelAttributes

    assert klass.respond_to? :sanitize_attributes
    assert klass.respond_to? :sanitize_model_attributes

    klass.class_eval do
      sanitize_attributes :name
      sanitize_model_attributes :model_name
    end

    instance = klass.new

    assert instance.respond_to? :name=
    assert instance.respond_to? :model_name=
  end
end
