# frozen_string_literal: true

require_relative "validators/base_validator"
require_relative "validators/visa_validator"
require_relative "validators/amex_validator"
require_relative "validators/mastercard_validator"

module Credit
  class Card
    def validate(number)
      return "VISA" if VisaValidator.new(number).validate
      return "AMEX" if AmexValidator.new(number).validate
      return "MASTERCARD" if MastercardValidator.new(number).validate

      "INVALID"
    end
  end
end
