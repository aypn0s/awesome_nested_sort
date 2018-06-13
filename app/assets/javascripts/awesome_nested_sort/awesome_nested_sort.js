$(document).ready(function() {
  $('.dd').each(function() {
    var el = $(this);
    var url = el.data('sort-url');
    var depth = el.data('depth');
    var model = el.data('model');
    initNestanle(el, url, depth, model);
  });
});

function initNestanle(element, url, depth, model) {
  element.nestable({
    sortUrl: url,
    maxDepth: depth,
    model: model,
    customCall: function(el, prev, next, depth, parent, url, model) {
      var data = {};
      data.authenticity_token = $('[name="csrf-token"]')[0].content;
      data.moved = el.data('id');
      data.prev = prev.data('id');
      data.next = next.data('id');
      data.depth = depth;
      data.model = model;
      if ( depth ) {
        data.parent = parent.data('id');
      }
      $.ajax({
        method: "put",
        url: url,
        dataType: "json",
        data: data
      });
    }
  });
}