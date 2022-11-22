require 'rails_helper'

describe User do


  describe 'Validations' do
    it 'should validate if first_name, last_name, email, password and password_confirmation are set' do
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password: '000',
        password_confirmation: '000'
      )
      
      @user.validate
      expect(@user).to be_valid
    end

    it 'should not validate if password is not set' do
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password_confirmation: '000'
      )
      
      @user.validate
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not validate if password_confirmation is not set' do
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password: '000'
      )
      
      @user.validate
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should not validate if password_confirmation and password do not match' do
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password: '000',
        password_confirmation: '123'
      )
      
      @user.validate
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not validate if the email is already used' do
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password: '000',
        password_confirmation: '000'
      )
      
      @user.save

      @user1 = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minhA@com',
        password: '000',
        password_confirmation: '000'
      )
      
      @user1.validate
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not validate if the email is not set' do
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        password: '000',
        password_confirmation: '000'
      )

      @user.validate
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not validate if the first_name is not set' do
      @user = User.new(
        last_name: 'Kim',
        email: 'minha@com',
        password: '000',
        password_confirmation: '000'
      )

      @user.validate
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should not validate if the last_name is not set' do
      @user = User.new(
        first_name: 'Minha',
        email: 'minha@com',
        password: '000',
        password_confirmation: '000'
      )

      @user.validate
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end


    it 'should not validate if the length of password is less than 2' do
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password: '0',
        password_confirmation: '0'
      )
      
      @user.validate
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
    end

  end


  describe '.authenticate_with_credentials' do

    it 'should authenticate with valid credentials' do 
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password: '000',
        password_confirmation: '000'
      )

      @user.save
      
      @result = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@result).not_to be_nil
    end

    it 'should not authenticate with invalid credentials' do 
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password: '000',
        password_confirmation: '123'
      )

      @user.save
      
      @result = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@result).to be_nil
    end

    it 'should authenticate with a few spaces before/after their email address' do 
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'minha@com',
        password: '000',
        password_confirmation: '000'
      )

      @user.save
      
      @result = User.authenticate_with_credentials('  minha@com  ', @user.password)
      expect(@result).not_to be_nil
    end

    it 'should authenticate with the wrong case for their email' do 
      @user = User.new(
        first_name: 'Minha',
        last_name: 'Kim',
        email: 'examPle@domain.COM'.downcase,
        password: '000',
        password_confirmation: '000'
      )

      @user.save
      
      @result = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', @user.password)
      expect(@result).not_to be_nil
    end


  end

end



