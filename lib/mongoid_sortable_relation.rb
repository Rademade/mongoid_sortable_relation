require 'rails'
require 'mongoid'
require 'mongoid_criteria_filter'

# many
require 'mongoid_sortable_relation/many/referenced'
require 'mongoid_sortable_relation/many/findable'
require 'mongoid_sortable_relation/many/macros'
require 'mongoid_sortable_relation/many/builder'
require 'mongoid_sortable_relation/many/origin_optional'

# many to many
require 'mongoid_sortable_relation/many_to_many/referenced'
require 'mongoid_sortable_relation/many_to_many/builder'

require 'mongoid_sortable_relation/metadata'

module MongoidSortableRelation

end