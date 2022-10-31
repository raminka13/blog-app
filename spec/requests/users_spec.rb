require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    usr = User.create(
      name: 'Jhon First',
      photo: 'https://randomuser.me/api/portraits/men/9.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      posts_counter: 0
    )

    before(:example) { get '/' }

    it 'Is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('index')
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include(usr.name)
    end
  end

  describe 'GET /show' do
    usr = User.create(
      name: 'Jhon First',
      photo: 'https://randomuser.me/api/portraits/men/9.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      posts_counter: 0
    )

    before(:example) { get "/users/#{usr.id}" }

    it 'Is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('show')
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include(usr.bio)
    end
  end

end
