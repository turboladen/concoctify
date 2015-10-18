require 'rspec/expectations'

RSpec::Matchers.define :have_property do |property_name|
  match do |model|
    @getter_name = property_name unless model.respond_to? property_name

    equals_method = "#{property_name}=".to_sym
    @setter_name = equals_method unless model.respond_to? equals_method

    !(@getter_name && @setter_name)
  end

  failure_message do |model|
    if @getter_name && @setter_name
      "expected #{model} to respond to ##{@getter_name} and ##{@setter_name} but it did not"
    elsif @getter_name
      "expected #{model} to respond to ##{@getter_name} but it did not"
    elsif @setter_name
      "expected #{model} to respond to ##{@setter_name} but it did not"
    else
      'shit'
    end
  end
end
