require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'Post1', text: 'This is my first post', comments_counter: 0, likes_counter: 0, author_id: 1)
  end

  before { subject.save }

  context 'title' do
    it 'title should be Post1' do
      expect(subject.title).to match('Post1')
    end

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title length should be less than 250 characters' do
      subject.title = 'abcdefgh' * 108
      expect(subject).to_not be_valid
    end
  end

  context 'text' do
    it 'text should be This is my first post' do
      expect(subject.text).to match('This is my first post')
    end

    it 'text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'text length should be less than 500 characters' do
      subject.text = 'abcdefgh' * 108
      expect(subject).to_not be_valid
    end
  end

  context 'comments_counter' do
    it 'comments_counter should be present' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be a number' do
      subject.comments_counter = 'hello'
      expect(subject).to_not be_valid
    end
  end

  context 'likes_counter' do
    it 'likes_counter should be present' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be a number' do
      subject.likes_counter = 'hello'
      expect(subject).to_not be_valid
    end
  end

  context 'recent_comments' do
    before(:each) do
      5.times do |comm|
        Comment.new(text: "Comment #{comm}", post_id: subject.id)
      end
    end

    it 'should return the 3 latest posts' do
      expect(subject.recent_comments).to eq(Comment.order(created_at: :desc).limit(5))
      expect(subject.recent_comments).to eq(Comment.last(5))
    end
  end
end
