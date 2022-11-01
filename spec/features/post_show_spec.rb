require 'rails_helper'

RSpec.feature 'PostShows', type: :feature do
  describe 'Show' do
    before(:example) do
      @usr1 = User.create(id: 1, name: 'Jack', photo: 'https://www/image', bio: 'From Colombia', posts_counter: 0)
      5.times do |post|
        Post.create(title: "Post-#{post + 1}", text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    comments_counter: 0, likes_counter: 0, id: post + 1, author_id: 1)
      end
      9.times do |comment|
        Comment.create(author_id: 1, post_id: 1, text: "Test comment #{comment + 1}")
        Like.create(author_id: 1, post_id: 1)
      end
      visit '/users/1/posts/1'
    end
    it 'Is creating new likes' do
      click_button 'Like Post'
      expect(page).to have_css('.social-post > span', text: '❤️ Likes: 10', count: 1)
      expect(page.current_path).to eql('/users/1/posts/1')
    end
    it 'Is creating new comments' do
      fill_in 'comment_text', with: 'New Comment'
      click_button 'Add Comment'
      expect(page).to have_css('.social-post > span', text: '📝 Comments: 10', count: 1)
      expect(page).to have_content('Jack: New Comment')
      expect(page.current_path).to eql('/users/1/posts/1')
    end
    it 'Is redirecting to all user post' do
      click_link 'Back to posts'
      expect(page.current_path).to eql('/users/1/posts')
    end
  end
end
