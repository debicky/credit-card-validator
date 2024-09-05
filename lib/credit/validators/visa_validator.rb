# frozen_string_literal: true

class VisaValidator < BaseValidator
  VISA_REGEX = /^4\d{12}(\d{3})?$/.freeze

  def initialize(number)
    @number = number
  end

  def validate
    return false unless length_and_bank_regex_correct?(@number, VISA_REGEX)

    check_sum_is_zero?(@number)
  end
end
