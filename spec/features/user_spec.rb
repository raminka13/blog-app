require 'rails_helper'

RSpec.feature 'Users', type: :feature do

  describe 'Users Index' do

    before(:example) do
    usr1 = User.create(name: 'Jack', photo: 'https://www.example.com/image', bio: 'Teacher from Colombia', posts_counter: 0)
    usr2 = User.create(name: 'Jhon', photo: 'https://www.example.com/image1', bio: 'Teacher from India', posts_counter: 0)
    visit '/'
  end

    it 'Is response status correct' do
      expect(page).to have_http_status(:ok)
    end

    it 'Is showing all users names' do
      expect(page).to have_content usr1.name && usr2.name
    end

    it 'Is showing all users images' do
      expect(page).to find("img[src='https://www.example.com/image']")
    end
  end
end
