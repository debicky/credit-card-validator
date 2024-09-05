# frozen_string_literal: true

RSpec.describe BaseValidator do
  describe "#validate" do
    let(:number) { "1234567890123456" }

    it "raises an NotImplementedError" do
      expect { described_class.new.validate(number) }.to raise_error(NotImplementedError)
    end
  end
end
