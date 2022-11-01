require 'rails_helper'

RSpec.feature 'UserShows', type: :feature do
  describe 'Show' do
    before(:example) do
      @usr1 = User.create(id: 1, name: 'Jack',
                          photo: 'https://www.example.com/image', bio: 'Teacher from Colombia', posts_counter: 9)
      @usr2 = User.create(id: 2, name: 'Jhon',
                          photo: 'https://www.example.com/image1', bio: 'Teacher from India', posts_counter: 7)
      5.times do |post|
        Post.create(title: "Post-#{post}",
                    text: 'Lorem ipsum dolor sit amet,
                    consectetur adipiscing elit. Nam quis commodo velit.
                    Maecenas quis tortor nec neque ornare pharetra vitae in quam.
                    Phasellus dapibus a dui at euismod. Suspendisse ac cursus ligula.
                    Pellentesque in augue sit amet ipsum condimentum facilisis.
                    Aenean rutrum feugiat condimentum.',
                    comments_counter: 5,
                    likes_counter: 4,
                    id: post,
                    author_id: 1)
      end
      visit '/users/1'
    end
    it 'Is displaying the user bio.' do
      expect(page).to have_content('Teacher from Colombia')
    end

    it 'Is displaying the user first 3 posts.' do
      expect(page).to have_css('.post-card', count: 3)
    end

    it 'Is displaying "See all post".' do
      expect(page).to have_content('See all posts')
    end

    it 'Is redirecting to create new post' do
      click_link 'Add new post'
      expect(page.current_path).to eql('/users/1/posts/new')
    end

    it 'Is redirecting to all user post' do
      click_link 'See all posts'
      expect(page.current_path).to eql('/users/1/posts')
    end
  end
end
