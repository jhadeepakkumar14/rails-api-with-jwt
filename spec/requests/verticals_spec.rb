require 'rails_helper'

RSpec.describe 'Verticals API', type: :request do
  let(:user) { create(:user) }
  let!(:verticals) { create_list(:vertical, 10) }
  let(:vertical_id) { verticals.first.id }
  let(:headers) { valid_headers }

  describe 'GET /verticals' do
    before { get '/verticals', params: {}, headers: headers }

    it 'returns verticals' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /verticals/:id' do
    before { get "/verticals/#{vertical_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the vertical' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(vertical_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:vertical_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Vertical/)
      end
    end
  end

  describe 'POST /verticals' do
    let(:valid_attributes) do
      { name: 'Vertical Name' }
    end

    context 'when the request is valid' do
      before { post '/verticals', params: valid_attributes.to_json, headers: headers }

      it 'creates a vertical' do
        expect(json['name']).to eq('Vertical Name')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { name: nil } }
      before { post '/verticals', params: invalid_attributes.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /verticals/:id' do
    let(:valid_attributes) { { name: 'Vertical New Name' } }

    context 'when the record exists' do
      before { put "/verticals/#{vertical_id}", params: valid_attributes.to_json, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /verticals/:id' do
    before { delete "/verticals/#{vertical_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end