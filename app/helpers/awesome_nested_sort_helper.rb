module AwesomeNestedSortHelper
  def nested_dd(objects, &block)
    objects = objects.order(:lft) if objects.is_a? Class

    return '' if objects.size == 0

    output = '
      <ol class="dd-list">
        <li class="dd-item dd3-item" data-id="' + objects.first.id.to_s + '">
          <div class="dd-handle dd3-handle"></div><div class="dd3-content">'
    path = [nil]

    objects.each_with_index do |o, i|
      if o.parent_id != path.last
        # We are on a new level, did we descend or ascend?
        if path.include?(o.parent_id)
          # Remove the wrong trailing path elements
          while path.last != o.parent_id
            path.pop
            output << '</li></ol>'
          end
          output << '</li><li class="dd-item dd3-item" data-id="' + o.id.to_s + '">
            <div class="dd-handle dd3-handle"></div><div class="dd3-content">'
        else
          if i != 0
            path << o.parent_id
            output << '
              </div><ol class="dd-list">
                <li class="dd-item dd3-item" data-id="' + o.id.to_s + '">
                  <div class="dd-handle dd3-handle"></div><div class="dd3-content">'
          else
            path << o.parent_id
            output = '
              <ol class="dd-list">
                <li class="dd-item dd3-item" data-id="' + objects.first.id.to_s + '">
                  <div class="dd-handle dd3-handle"></div><div class="dd3-content">'
          end
        end
      elsif i != 0
        output << '</div></li><li class="dd-item dd3-item" data-id="' + o.id.to_s + '">
          <div class="dd-handle dd3-handle"></div><div class="dd3-content">'
      end
      output << capture(o, path.size - 1, &block)
    end

    output << '</div></li></ol>' * path.length
    output.html_safe
  end
end