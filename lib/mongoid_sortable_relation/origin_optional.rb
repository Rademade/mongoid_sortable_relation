# encoding: utf-8
module Origin
  module Optional

    def prepend_order_by(*spec)
      option(spec) do |options, query|
        spec.compact.each do |criterion|
          criterion.__sort_option__.each_pair do |field, direction|
            add_sort_option(options, field, direction, true)
          end
          query.pipeline.push('$sort' => options[:sort]) if query and aggregating? # todo unknown method aggregating?
        end
      end
    end
    alias :prepend_order :prepend_order_by

    private

    def add_sort_option(options, field, direction, prepend = false)
      if driver == :mongo
        sorting = (options[:sort] || []).dup
        sort_params = [field, direction]
        prepend ? sorting.unshift(sort_params) : sorting.push(sort_params)
      else
        sorting = (options[:sort] || {}).dup
        prepend ? sorting = { field => direction }.merge(sorting) : sorting[field] = direction
      end
      options.store(:sort, sorting)
    end

  end
end