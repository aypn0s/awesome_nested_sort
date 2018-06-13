module AwesomeNestedSortController
  module Sort
    def sort
      klass = params[:model].classify.constantize
      moved_node = klass.find(params[:moved])

      if moved_node.level == params[:depth].to_i || params[:depth].to_i == 0
        if params[:prev].present?
          prev_category = klass.find(params[:prev])
          moved_node.move_to_right_of(prev_category)
        elsif params[:next].present?
          next_category = klass.find(params[:next])
          moved_node.move_to_left_of(next_category)
        end
      else
        parent_category = klass.find(params[:parent])
        moved_node.move_to_child_of(parent_category)
      end

      render json: { status: 'ok' }
    end
  end
end