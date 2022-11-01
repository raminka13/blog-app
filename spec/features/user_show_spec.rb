require 'rails_helper'

RSpec.feature 'UserShows', type: :feature do
  describe 'Show' do
    before(:example) do
      @usr1 = User.create(id: 1, name: 'Jack', photo: 'https://www/image', bio: 'From Colombia', posts_counter: 9)
      @usr2 = User.create(id: 2, name: 'Jhon', photo: 'https://www/image1', bio: 'From India', posts_counter: 7)
      5.times do |post|
        Post.create(title: "Post-#{post + 1}",
                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis commodo velit.
                    Maecenas quis tortor nec neque ornare pharetra vitae in quam.',
                    comments_counter: 0, likes_counter: 0, id: post + 1, author_id: 1)
      end
      visit '/users/1'
    end
    it 'Is displaying the user bio.' do
      expect(page).to have_content('From Colombia')
    end
    it 'Is displaying the user first 3 posts.' do
      expect(page).to have_css('.post-card', count: 3)
    end
    it 'Is redirecting to create new post' do
      click_link 'Add new post'
      expect(page.current_path).to eql('/users/1/posts/new')
    end
    it 'Is redirecting to all user post' do
      click_link 'See all posts'
      expect(page.current_path).to eql('/users/1/posts')
    end
    it 'I can some of the posts ' do
      expect(page).to have_content 'Lorem ipsum dolor sit amet,'
    end

    it 'Is showing users images' do
      page.find("img[src='https://www/image']")
    end

    it 'Is showing all users names' do
      expect(page).to have_content @usr1.name
    end
  end
end
