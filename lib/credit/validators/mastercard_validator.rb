# frozen_string_literal: true

class MastercardValidator < BaseValidator
  MASTERCARD_REGEX = /^5[1-5]\d{14}$/.freeze

  def initialize(number)
    @number = number
  end

  def validate
    return false unless length_and_bank_regex_correct?(@number, MASTERCARD_REGEX)

    check_sum_is_zero?(@number)
  end
end
