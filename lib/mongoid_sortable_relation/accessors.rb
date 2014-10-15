module Mongoid
  module Relations
    module Accessors

      private

      def sort_related_items(object, name, metadata)
        if metadata.relation.macro == :has_many
          update_sortable_field(object, metadata)
        else
          nullify_related_items(send(name))
        end
        object.each &:reload
      end

      def nullify_related_items(related_items)
        related_items.nullify unless related_items.empty?
      end

      def update_sortable_field(object, metadata)
        object.each_with_index do |entity, index|
          entity.send(:"#{metadata.sortable_field}=", index + 1)
          entity.save
        end
      end

      module ClassMethods

        def setter(name, metadata)
          re_define_method("#{name}=") do |object|
            without_autobuild do
              sort_related_items(object, name, metadata) if metadata.sortable?
              if value = get_relation(name, metadata, object)
                set_relation(name, value.substitute(object.substitutable))
              else
                __build__(name, object.substitutable, metadata)
              end
            end
          end
          self
        end

      end

    end
  end
end