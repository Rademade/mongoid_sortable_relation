# encoding: utf-8
module Mongoid
  module Relations
    module Macros
      module ClassMethods

        alias_method :original_reference, :reference

        private

        def reference(metadata, type = Object)
          original_reference(metadata, type)
          if metadata.sortable? and metadata.relation == Mongoid::Relations::Referenced::Many
            to_class = metadata.class_name.classify.constantize
            to_class.field metadata.sortable_field, :type => Integer
            to_class.scope metadata.sortable_scope, -> { prepend_order_by(metadata.sortable_field => :asc) }
          end
        end

      end
    end
  end
end