require 'spec_helper'

describe 'One to many sortable relation' do

  let(:user) do
    User.create
  end

  describe 'get relations' do

    let!(:posts) do
      Post.create :user => user, :title => 'Title1', :user_position => 2
      Post.create :user => user, :title => 'Title2', :user_position => 1
      Post.create :user => user, :title => 'Title3', :user_position => 3
    end

    it 'returns ordered relations' do
      expect(user.posts.map(&:title)).to eq(%w(Title2 Title1 Title3))
    end

  end

end