require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: 'Bubba') }
  let(:cookies) { Dessert.new("cookies", 18, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookies.type).to eq('cookies')
    end

    it "sets a quantity" do
      expect(cookies.quantity).to eq(18)
    end

    it "starts ingredients as an empty array" do
      expect(cookies.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new('cookies', 'five', 'James') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      cookies.add_ingredient('raisins')
      expect(cookies.ingredients).to include('raisins')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    ingredients = ['sugar', 'butter', 'flour', 'raisins']

      ingredients.each do |ingredient|
        cookies.add_ingredient(ingredient)
      end
      cookies.mix!
      expect(cookies.ingredients).to_not eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookies.eat(6)
      expect(cookies.quantity).to eq(12)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cookies.eat(150)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Bubba the Great Baker")
      expect(cookies.serve).to eq("Chef Bubba the Great Baker has made 18 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
    expect(chef).to receive(:bake).with(cookies)
      cookies.make_more
    end
  end
end
