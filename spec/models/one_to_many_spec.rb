require 'spec_helper'

describe 'One to many sortable relation' do

  let(:user) do
    User.create
  end

  let!(:posts) do
    Post.create :user => user, :title => 'Title1', :user_position => 2
    Post.create :user => user, :title => 'Title2', :user_position => 1
    Post.create :user => user, :title => 'Title3', :user_position => 3
  end

  describe '.getter' do

    it 'returns ordered relations' do
      expect(user.posts.map(&:title)).to eq(%w(Title2 Title1 Title3))
    end

  end

  describe '.setter' do

    it 'updates order' do
      posts = [Post.find_by(:title => 'Title1'), Post.find_by(:title => 'Title3'), Post.find_by(:title => 'Title2')]
      user.posts = posts
      user.save
      expect(user.posts.map(&:title)).to eq(posts.map(&:title))
    end

  end

end