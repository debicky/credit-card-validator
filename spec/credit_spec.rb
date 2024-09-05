# frozen_string_literal: true

RSpec.describe Credit do
  it "has a version number" do
    expect(Credit::VERSION).to eq("0.2.0")
  end

  context "Error" do
    it "inherits from StandardError" do
      expect(Credit::Error.superclass).to eq(StandardError)
    end
  end
end
