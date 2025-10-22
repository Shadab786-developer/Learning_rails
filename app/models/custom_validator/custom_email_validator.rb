class CustomEmailValidator < ActiveModel::Validator
def validate(record)
  options[:fields].each do |field|
    value = record.send(field)
    if value.blank?
      record.errros.add field, "is requried ?"
    elsif value.include?("spam")
    record.errros.add field , "contains invalid word 'spam'"
    end
  end
  
end
end