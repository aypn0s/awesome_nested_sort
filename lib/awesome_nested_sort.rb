require "awesome_nested_sort/version"
require "awesome_nested_sort/engine"

module AwesomeNestedSort
  module Methods
    extend ActiveSupport::Concern
 
    class_methods do
      def sort_set
        order(lft: :asc)
      end
    end
  end
end
