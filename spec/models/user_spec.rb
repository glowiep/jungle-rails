require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with all attributes' do
      @user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      @user.save
      expect(@user).to be_valid
    end
    
    it 'is not valid without a first name' do
      @user = User.new(
        first_name: nil,
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'is not valid without a last name' do
      @user = User.new(
        first_name: "Gloria",
        last_name: nil,
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it 'is not valid without an email' do
      @user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: nil,
        password: "1234567",
        password_confirmation: "1234567"
      )
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid without a password' do
      @user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: nil,
        password_confirmation: "1234567"
      )
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid without a password confirmation' do
      @user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: nil
      )
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    
    
  end
  
end
