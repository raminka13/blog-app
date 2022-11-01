require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) do
      User.create(
        id: 1,
        name: 'Jhon First',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        posts_counter: 0
      )
      get '/users/1/posts'
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
      Post.create(title: 'Post-1}',
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis commodo velit.
        Maecenas quis tortor nec neque ornare pharetra vitae in quam.',
                  comments_counter: 0, likes_counter: 0, id: 1, author_id: 1)
      get '/users/1/posts/1'
    end

    it 'Is response status correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Is correct template rendered' do
      expect(response).to render_template('show')
    end

    it 'Is the body includes correct text' do
      expect(response.body).to include('Lorem ipsum dolor sit amet,')
    end
  end
end
