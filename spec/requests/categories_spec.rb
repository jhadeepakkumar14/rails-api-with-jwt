require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let(:user) { create(:user) }
  let!(:vertical) { create(:vertical) }
  let!(:categories) { create_list(:category, 20, vertical_id: vertical.id) }
  let(:vertical_id) { vertical.id }
  let(:id) { categories.first.id }
  let(:headers) { valid_headers }

  describe 'GET /verticals/:vertical_id/categories' do
    before { get "/verticals/#{vertical_id}/categories", params: {}, headers: headers }

    context 'when vertical exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all vertical categories' do
        expect(json.size).to eq(20)
      end
    end

    context 'when vertical does not exist' do
      let(:vertical_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Vertical/)
      end
    end
  end

  describe 'GET /verticals/:vertical_id/categories/:id' do
    before { get "/verticals/#{vertical_id}/categories/#{id}", params: {}, headers: headers }

    context 'when vertical category exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the category' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when vertical category does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  describe 'POST /verticals/:vertical_id/categories' do
    let(:valid_attributes) { { name: 'Category Name', state: "active" } }

    context 'when request attributes are valid' do
      before { post "/verticals/#{vertical_id}/categories", params: valid_attributes.to_json, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/verticals/#{vertical_id}/categories", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /verticals/:vertical_id/categories/:id' do
    let(:valid_attributes) { { name: 'Category Name' } }

    before { put "/verticals/#{vertical_id}/categories/#{id}", params: valid_attributes.to_json, headers: headers }

    context 'when category exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the category' do
        updated_category = Category.find(id)
        expect(updated_category.name).to match(/Category Name/)
      end
    end

    context 'when the category does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  describe 'DELETE /verticals/:id' do
    before { delete "/verticals/#{vertical_id}/categories/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end