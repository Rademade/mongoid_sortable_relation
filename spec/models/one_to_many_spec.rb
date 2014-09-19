require 'spec_helper'

describe 'One to many sortable relation' do

  let(:user) do
    FactoryGirl.create :user
  end

  describe 'get relations' do

    let!(:posts) do
      FactoryGirl.create :post, :user => user, :title => 'Title1', :user_position => 2
      FactoryGirl.create :post, :user => user, :title => 'Title2', :user_position => 1
      FactoryGirl.create :post, :user => user, :title => 'Title3', :user_position => 3
    end

    it 'returns ordered relations' do
      expect(user.posts.map(&:title)).to eq(%w(Title2 Title1 Title3))
    end

  end

end