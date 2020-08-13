RSpec.describe ISBN::Calculator do
  it "has a version number" do
    expect(ISBN::Calculator::VERSION).not_to be nil
  end

  it "rejects invalid ISBN numbers" do
    expect(ISBN::Calculator.calculate(0).to eq(false))
  end

  it "calculates the ISBN check digit of 978014300723" do
    expect(ISBN::Calculator.calculate(978014300723).to eq(4))
  end

  it "computes the weighted checksum correctly" do
    expect(ISBN::Calculator.weighted_calc 297, 111).to eq(18)
    expect(ISBN::Calculator.weighted_calc 8842, 2348).to eq(72)
    expect(ISBN::Calculator.weighted_calc 23042, 11111).to eq(11)
  end
end
