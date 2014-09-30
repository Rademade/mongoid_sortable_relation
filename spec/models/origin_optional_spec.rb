require 'spec_helper'

describe Origin::Optional do

  describe '#prepend_order_by' do

    let!(:users) do
      User.create :name => 'Name1', :age => 2
      User.create :name => 'Name2', :age => 1
      User.create :name => 'Name3', :age => 2
    end

    it 'adds order' do
      ordered_users = User.prepend_order_by(:name => :desc)
      expect(ordered_users.map(&:name)).to eq(%w(Name3 Name2 Name1))
    end

    it 'prepends order' do
      ordered_users = User.order_by(:name => :desc).prepend_order_by(:age => :asc)
      expect(ordered_users.map(&:name)).to eq(%w(Name2 Name3 Name1))
    end

  end

end