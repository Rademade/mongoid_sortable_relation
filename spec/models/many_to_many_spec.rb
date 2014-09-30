require 'spec_helper'

describe 'Many to many sortable relation' do

  let(:post) do
    Post.create
  end

  let!(:tags) do
    tag1 = Tag.create :name => 'Name1'
    tag2 = Tag.create :name => 'Name2'
    tag3 = Tag.create :name => 'Name3'
    post.tags = [tag2, tag1, tag3]
    post.save
  end

  describe '.getter' do

    it 'returns ordered relations' do
      expect(post.tags.map(&:name)).to eq(%w(Name2 Name1 Name3))
    end

  end

  describe '.setter' do

    it 'updates order' do
      tags = [Tag.find_by(:name => 'Name1'), Tag.find_by(:name => 'Name3'), Tag.find_by(:name => 'Name2')]
      post.tags = tags
      expect(post.tags.map(&:name)).to eq(tags.map(&:name))
    end

  end

end