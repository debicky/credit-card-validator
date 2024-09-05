# frozen_string_literal: true

RSpec.describe Credit::Card do
  describe "#validate" do
    subject(:credit_card) { described_class.new }

    context "with VISA card provided" do
      valid_visa_card_numbers = %w[4111111111111111 4012888888881881 4222222222222]

      valid_visa_card_numbers.each do |card_number|
        it "calls VisaValidator" do
          visa_validator = instance_double(VisaValidator, validate: true)
          allow(VisaValidator).to receive(:new).with(card_number).and_return(visa_validator)

          credit_card.validate(card_number)

          expect(VisaValidator).to have_received(:new).with(card_number).once
          expect(visa_validator).to have_received(:validate).once
        end

        it "returns 'VISA' for a valid card number" do
          expect(credit_card.validate(card_number)).to eq("VISA")
        end
      end
    end

    context "with AMEX card provided" do
      valid_amex_card_numbers = %w[378282246310005 371449635398431 378734493671000]

      valid_amex_card_numbers.each do |card_number|
        it "calls AmexValidator" do
          amex_validator = instance_double(AmexValidator, validate: true)
          allow(AmexValidator).to receive(:new).with(card_number).and_return(amex_validator)

          credit_card.validate(card_number)

          expect(AmexValidator).to have_received(:new).with(card_number).once
          expect(amex_validator).to have_received(:validate).once
        end

        it "returns 'AMEX' for a valid card number" do
          expect(credit_card.validate(card_number)).to eq("AMEX")
        end
      end
    end

    context "with MASTERCARD card provided" do
      valid_mastercard_card_numbers = %w[5555555555554444 5105105105105100 5555444433331111]

      valid_mastercard_card_numbers.each do |card_number|
        it "calls MastercardValidator" do
          mastercard_validator = instance_double(MastercardValidator, validate: true)
          allow(MastercardValidator).to receive(:new).with(card_number).and_return(mastercard_validator)

          credit_card.validate(card_number)

          expect(MastercardValidator).to have_received(:new).with(card_number).once
          expect(mastercard_validator).to have_received(:validate).once
        end

        it "returns 'MASTERCARD' for a valid card number" do
          expect(credit_card.validate(card_number)).to eq("MASTERCARD")
        end
      end
    end

    context "with INVALID card provided" do
      let(:card_number) { "1234567890123456" }

      it "returns 'INVALID' for an invalid card number" do
        expect(credit_card.validate(card_number)).to eq("INVALID")
      end
    end
  end
end
