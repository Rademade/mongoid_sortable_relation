class Post
  include Mongoid::Document

  belongs_to :user
  has_and_belongs_to_many :tags, :sortable => true

  field :title, :type => String

end