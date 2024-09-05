# frozen_string_literal: true

class AmexValidator < BaseValidator
  AMEX_REGEX = /^3[47]\d{13}$/.freeze

  def initialize(number)
    @number = number
  end

  def validate
    return false unless length_and_bank_regex_correct?(@number, AMEX_REGEX)

    check_sum_is_zero?(@number)
  end
end
