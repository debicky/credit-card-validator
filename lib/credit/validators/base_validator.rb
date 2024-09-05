# frozen_string_literal: true

class BaseValidator
  def validate(_number)
    raise NotImplementedError, "Subclasses must implement this method"
  end

  private

  def length_and_bank_regex_correct?(number, regex)
    correct_length?(number) && correct_bank_regex?(number, regex)
  end

  def correct_length?(number)
    raw_number = number.to_s.gsub(/[\s-]/, "")

    raw_number.match?(/^\d{13,16}$/)
  end

  def correct_bank_regex?(number, regex)
    number.match?(regex)
  end

  def check_sum_is_zero?(number)
    digits = to_digits(number)
    check_digit = digits.pop
    digits.reverse!
    sum = sum_digits(digits)

    ((sum + check_digit) % 10).zero?
  end

  def to_digits(number)
    number.to_s.chars.map(&:to_i)
  end

  def sum_digits(digits)
    adjusted_digits = double_even_indexed_digits(digits).map { |digit| adjust_digit(digit) }
    adjusted_digits.sum
  end

  def double_even_indexed_digits(digits)
    digits.map.with_index { |digit, index| index.even? ? digit * 2 : digit }
  end

  def adjust_digit(digit)
    digit > 9 ? digit - 9 : digit
  end
end
