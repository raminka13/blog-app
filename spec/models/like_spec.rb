require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(author_id: 1, post_id: 1)
  end

  before { subject.save }

  context 'author_id' do
    it 'should be 1' do
      expect(subject.author_id).to eql(1)
    end
  end

  context 'post_id' do
    it 'should be 1' do
      expect(subject.post_id).to eql(1)
    end
  end
end
