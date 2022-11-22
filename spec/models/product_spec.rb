require 'rails_helper'
# require 'product'

describe Product do
  describe 'Validation' do

    it 'should validate "name"' do
      @category = Category.new(
        name: 'Flowers'
      )
      @product = Product.new(
        name: 'Rose',
        price: 500,
        quantity: 30,
        category: @category
      )
      @product.validate
      expect(@product).to be_valid
    end


    it 'should validate "name"' do
      @category = Category.new(
        name: 'Flowers'
      )
      @product = Product.new(
        name: nil,
        price: 500,
        quantity: 30,
        category: @category
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end


    it 'should validate "price"' do
      @category = Category.new(
        name: 'Flowers'
      )
      @product = Product.new(
        name: 'Rose',
        quantity: 30,
        category: @category
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate "price"' do
      @category = Category.new(
        name: 'Flowers'
      )
      @product = Product.new(
        name: 'Rose',
        price: 500,
        category: @category
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should validate "price"' do
      @category = Category.new(
        name: 'Flowers'
      )
      @product = Product.new(
        name: 'Rose',
        price: 500,
        quantity: 30,
        category: nil
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end


  end

end


