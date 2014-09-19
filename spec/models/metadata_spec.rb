require 'spec_helper'

describe Mongoid::Relations::Metadata do

  let(:post_relation) do
    User.relations['posts']
  end

  it 'is sortable' do
    expect(post_relation.sortable?).to be
  end

  it 'generates sortable field name' do
    expect(post_relation.sortable_field).to eq(:'user_position')
  end

  it 'generates sortable scope name' do
    expect(post_relation.sortable_scope).to eq(:'sort_for_user')
  end

end