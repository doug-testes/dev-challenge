class CnpjFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if self.class.invalid?(value)
      record.errors.add(attribute, (options[:message] || :cnpj_format))
    end
  end

  def self.valid?(value)
    CNPJ.valid?(value)
  end

  def self.invalid?(value)
    !valid?(value)
  end
end
