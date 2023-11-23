# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do

      get :index
      expect(response).to be_successful
    end

    it 'assigns @categories and @total_amounts' do

      category = create(:category, user: user)
      create(:transaction, category: category, amount: 50)

      get :index
      expect(assigns(:categories)).to eq([category])
      expect(assigns(:total_amounts)).to have_key(category.id)
    end
  end

describe 'POST #create' do

  context 'with invalid parameters' do
    let(:invalid_attributes) { { name: nil } }

    it 'does not create a new Category' do
      expect {
        post :create, params: { category: invalid_attributes }
      }.not_to change { Category.count }
    end

    it 're-renders the new template' do
      post :create, params: { category: invalid_attributes }
      expect(response).to render_template(:new)
    end
  end
end
end
