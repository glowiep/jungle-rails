require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    before(:each) do
      @category1 = Category.new(name: 'succulents')
      @category1.save
    end

    it 'is valid with all 4 attributes' do
      product = Product.new(
        name: "Cacti",
        price_cents: "2000",
        quantity: "3",
        category: @category1
      )
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(
        name: nil,
        price_cents: "2000",
        quantity: "3",
        category: @category1
      )
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      product = Product.new(
        name: "Cacti",
        price_cents: nil,
        quantity: "3",
        category: @category1
      )
      product.save
      expect(product.errors.full_messages).to include("Price is not a number")
    end

    it 'is not valid without a quantity' do
      product = Product.new(
        name: "Cacti",
        price_cents: "2000",
        quantity: nil,
        category: @category1
      )
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(
        name: "Cacti",
        price_cents: "2000",
        quantity: "3",
        category: nil
      )
      product.save
      expect(product.errors.full_messages).to include("Category must exist")
    end
    
    
    
    
    
  end
  
end
