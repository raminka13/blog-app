require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) do
      User.create(
        name: 'Jhon First',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        posts_counter: 0
      )
      get '/'
    end
    it 'Is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('index')
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include('Jhon First')
    end
  end

  describe 'GET /show' do
    before(:example) do
      User.create(
        id: 1,
        name: 'Jhon First',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        posts_counter: 0
      )
      get '/users/1'
    end

    it 'Is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('show')
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include('Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
    end
  end
end
