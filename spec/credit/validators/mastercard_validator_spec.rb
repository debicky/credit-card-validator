# frozen_string_literal: true

RSpec.describe MastercardValidator do
  describe "#validate" do
    context "with a valid number" do
      it 'returns "MASTERCARD"' do
        valid_numbers = %w[5555555555554444 5105105105105100]

        valid_numbers.each do |number|
          expect(described_class.new(number).validate).to be_truthy
        end
      end
    end

    context "with an invalid number" do
      it "returns false" do
        invalid_numbers = %w[5105105105105101 555555555555444]

        invalid_numbers.each do |number|
          expect(described_class.new(number).validate).to be_falsey
        end
      end
    end
  end
end
