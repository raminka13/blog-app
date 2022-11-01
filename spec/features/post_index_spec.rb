require 'rails_helper'

RSpec.feature 'Post', type: :feature do
  describe 'Index' do
    before(:example) do
      @usr1 = User.create(id: 1, name: 'Jack', photo: 'https://www/image', bio: 'From Colombia', posts_counter: 0)
      5.times do |post|
        Post.create(title: "Post-#{post + 1}",
                    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis commodo velit.
                    Maecenas quis tortor nec neque ornare pharetra vitae in quam.',
                    comments_counter: 0, likes_counter: 0, id: post + 1, author_id: 1)
      end
      9.times do |comment|
        Comment.create(author_id: 1, post_id: 1, text: "Test comment #{comment + 1}")
        Like.create(author_id: 1, post_id: 1)
      end
      visit '/users/1/posts'
    end
    it 'I can see how many comments a post has.' do
      expect(page).to have_css('.social-post span', text: 'Comments: 9', count: 1)
    end
    it 'I can see how many likes a post has.' do
      expect(page).to have_css('.social-post span', text: 'Likes: 9', count: 1)
    end
    it 'When I click on a post, it redirects me to that posts show page.' do
      click_link 'Post-1'
      expect(page.current_path).to eql('/users/1/posts/1')
    end
    it 'Is displaying the user all posts.' do
      expect(page).to have_css('.post-card', count: 5)
    end
  end
end
