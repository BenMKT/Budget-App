require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    it "is valid with a name and icon" do
      user = User.create(email: "test@example.com", password: "password")
      category = Category.new(name: "Food", icon: "fa-utensils", user: user)
      expect(category).to be_valid
    end

    it "is invalid without a name" do
      user = User.create(email: "test@example.com", password: "password")
      category = Category.new(icon: "fa-utensils", user: user)
      expect(category).to_not be_valid
      expect(category.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an icon" do
      user = User.create(email: "test@example.com", password: "password")
      category = Category.new(name: "Food", user: user)
      expect(category).to_not be_valid
      expect(category.errors[:icon]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "belongs to a user" do
      user = User.create(email: "test@example.com", password: "password")
      category = Category.new(name: "Food", icon: "fa-utensils", user: user)
      expect(category.user).to eq(user)
    end
  end
end
