# frozen_string_literal: true

RSpec.describe AmexValidator do
  describe "#validate" do
    context "with a valid number" do
      it 'returns "AMEX"' do
        valid_numbers = %w[378282246310005 371449635398431]

        valid_numbers.each do |number|
          expect(described_class.new(number).validate).to be_truthy
        end
      end
    end

    context "with an invalid number" do
      it "returns false" do
        invalid_numbers = %w[371449635398432 34322187536445]

        invalid_numbers.each do |number|
          expect(described_class.new(number).validate).to be_falsey
        end
      end
    end
  end
end
