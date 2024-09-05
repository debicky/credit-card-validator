# frozen_string_literal: true

RSpec.describe VisaValidator do
  describe "#validate" do
    context "with a valid number" do
      it 'returns "VISA"' do
        valid_numbers = %w[4111111111111111 4012888888881881 4222222222222]
        valid_numbers.each do |number|
          expect(described_class.new(number).validate).to be_truthy
        end
      end
    end

    context "with an invalid number" do
      it "returns false" do
        invalid_numbers = %w[4111111111111112 491641812196311]

        invalid_numbers.each do |number|
          expect(described_class.new(number).validate).to be_falsey
        end
      end
    end
  end
end
