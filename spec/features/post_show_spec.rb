require 'rails_helper'

RSpec.feature 'UserShows', type: :feature do
  describe 'Post Show' do
    before(:example) do
      @usr1 = User.create(id: 1, name: 'Jack',
                          photo: 'https://www.example.com/image', bio: 'Teacher from Colombia', posts_counter: 0)

      @post = Post.create(title: 'Post-1',
                          text: 'Lorem ipsum dolor sit amet,consectetur adipiscing elit. Nam quis commodo velit.',
                          comments_counter: 0,
                          likes_counter: 0,
                          id: 1,
                          author_id: 1)

      10.times do |comment|
        Comment.create(author_id: 1,
                       post_id: 1,
                       text: "Test comment #{comment + 1}")
        Like.create(author_id: 1, post_id: 1)
      end
      visit '/users/1/posts/1'
    end

    it 'I can see the posts title.' do
      expect(page).to have_content('Post-1')
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content('Jack')
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_css('.social-post span', text: 'Comments: 10')
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_css('.social-post span', text: 'Likes: 10')
    end

    it 'I can see the post body.' do
      expect(page).to have_css('.post-text', text: @post.text)
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_css('.post-comments strong', text: @usr1.name, count: 10)
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content('Test comment 1')
      expect(page).to have_content('Test comment 2')
      expect(page).to have_content('Test comment 3')
      expect(page).to have_content('Test comment 4')
      expect(page).to have_content('Test comment 5')
      expect(page).to have_content('Test comment 6')
      expect(page).to have_content('Test comment 7')
      expect(page).to have_content('Test comment 8')
      expect(page).to have_content('Test comment 9')
      expect(page).to have_content('Test comment 10')
    end
  end
end
