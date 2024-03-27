require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with all attributes' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      user.save
      expect(user).to be_valid
    end
    
    it 'is not valid without a first name' do
      user = User.new(
        first_name: nil,
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      user.save
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'is not valid without a last name' do
      user = User.new(
        first_name: "Gloria",
        last_name: nil,
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      user.save
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it 'is not valid without an email' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: nil,
        password: "1234567",
        password_confirmation: "1234567"
      )
      user.save
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid without a password' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: nil,
        password_confirmation: "1234567"
      )
      user.save
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid without a password confirmation' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: nil
      )
      user.save
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end  
    
    it 'must have a password greater than 6 characters' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "123",
        password_confirmation: "123"
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 7 characters)")
    end

    it 'emails must be unique' do
      user1 = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      user1.save
      user2 = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    
    it 'will not accept passwords that do not match' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567i"
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    
  end

  describe 'authenticate _with_credentials' do
    it 'will not authenticate an email that does not exist' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: " glim@test.com  ",
        password: "1234567",
        password_confirmation: "1234567"
      )
      authenticated_user = User.authenticate_with_credentials('new@test.com', "password")
      expect(authenticated_user).to be nil
    end

    it 'will not authenticate incorrect passwords' do
      User.create(
        first_name: "Gloria",
        last_name: "Lim",
        email: " glim@test.com  ",
        password: "1234567",
        password_confirmation: "1234567"
      )
      authenticated_user = User.authenticate_with_credentials('glim@test.com', "password")
      expect(authenticated_user).to be nil
    end

    it 'will authenticate correctly spelled emails with wrong case' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      user.save
      authenticated_user = User.authenticate_with_credentials('GLIm@test.com ', "1234567")
      expect(authenticated_user).to eq(user)
    end
    
    it 'will return the user if email and password match' do
      user = User.new(
        first_name: "Gloria",
        last_name: "Lim",
        email: "glim@test.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      user.save
      authenticated_user = User.authenticate_with_credentials('glim@test.com', "1234567")
      expect(authenticated_user).to eq(user)
    end
    
    
  end
  
  
end
