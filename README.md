Mongoid sortable relation
========
[![Build Status](https://api.travis-ci.org/Rademade/mongoid_sortable_relation.svg?branch=master)][travis-ci]

[travis-ci]: https://travis-ci.org/Rademade/mongoid_sortable_relation

# Installation
```
gem install mongoid_sortable_relation
```

# Usage
Add `sortable` option to relation
```ruby
has_many :posts, :sortable => true
has_and_belongs_to_many :tags, :sortable => true
```
