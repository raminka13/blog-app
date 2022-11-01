require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'Index' do
    before(:example) do
      @usr1 = User.create(id: 1, name: 'Jack',
                          photo: 'https://www.example.com/image', bio: 'Teacher from Colombia', posts_counter: 9)
      @usr2 = User.create(id: 2, name: 'Jhon',
                          photo: 'https://www.example.com/image1', bio: 'Teacher from India', posts_counter: 7)
      visit '/'
    end

    it 'Is response status correct' do
      expect(page).to have_http_status(:ok)
    end

    it 'Is showing all users names' do
      expect(page).to have_content @usr1.name
    end

    it 'Is showing all users posts count' do
      expect(page).to have_content('9')
      expect(page).to have_content('7')
    end

    it 'Is showing users images' do
      page.find("img[src='https://www.example.com/image']")
    end

    it 'Is showing all users images' do
      expect(page).to have_selector('img', count: 3)
    end

    it 'Is redirecting to user show' do
      click_link 'Jack'
      expect(page.current_path).to eql('/users/1')
    end
  end
end
