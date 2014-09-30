class User
  include Mongoid::Document

  has_many :posts, :sortable => true

  field :name, :type => String
  field :age, :type => Integer

end