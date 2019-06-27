require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  let(:user) { create(:user) }
  let!(:vertical) { create(:vertical) }
  let!(:category) { create(:category, vertical_id: vertical.id) }
  let!(:courses) { create_list(:course, 20, category_id: category.id) }
  let(:vertical_id) { vertical.id }
  let(:category_id) { category.id }
  let(:id) { courses.first.id }
  let(:headers) { valid_headers }

  describe 'GET /verticals/:vertical_id/categories/:category_id/courses' do
    before { get "/verticals/#{vertical_id}/categories/#{category_id}/courses", params: {}, headers: headers }

    context 'when category exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all category courses' do
        expect(json.size).to eq(20)
      end
    end

    context 'when category does not exist' do
      let(:category_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Category/)
      end
    end
  end

  describe 'GET /verticals/:vertical_id/categories/:category_id/courses/:id' do
    before { get "/verticals/#{vertical_id}/categories/#{category_id}/courses/#{id}", params: {}, headers: headers }

    context 'when category course exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the course' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when category course does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Course/)
      end
    end
  end

  describe 'POST /verticals/:vertical_id/categories/:category_id/courses' do
    let(:valid_attributes) { { name: 'Course Name', state: "active", author: 'test author' } }

    context 'when request attributes are valid' do
      before { post "/verticals/#{vertical_id}/categories/#{category_id}/courses", params: valid_attributes.to_json, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/verticals/#{vertical_id}/categories/#{category_id}/courses", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /verticals/:vertical_id/categories/:category_id/courses/:id' do
    let(:valid_attributes) { { name: 'Course Name' } }

    before { put "/verticals/#{vertical_id}/categories/#{category_id}/courses/#{id}", params: valid_attributes.to_json, headers: headers }

    context 'when course exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the category' do
        updated_course = Course.find(id)
        expect(updated_course.name).to match(/Course Name/)
      end
    end

    context 'when the course does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Course/)
      end
    end
  end

  describe 'DELETE /verticals/:vertical_id/categories/:category_id' do
    before { delete "/verticals/#{vertical_id}/categories/#{category_id}/courses/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end