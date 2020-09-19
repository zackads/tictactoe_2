RSpec.describe RubyBoilerplate do
  describe ".add" do
    context "given an empty string" do
      it "returns zero" do
        expect(described_class.example_method("")).to eq(0)
      end
    end
  end
end
