# AwesomeNestedSort

Easy GUI sorting for awesome nested set (works with jQuery)

<img src="https://raw.githubusercontent.com/aypn0s/awesome_nested_sort/master/docs/screen.png"
  width="300">

## Requirements

Your project need to use jQuery and awesome_nested_set for this gem to work

## Installation

### Gemfile

```ruby
gem 'awesome_nested_sort', github: 'aypn0s/awesome_nested_sort'
```

### Model
Include gem methods in the model.
```ruby
include AwesomeNestedSort::Methods
```

### Controller
Include the sort action.
```ruby
include AwesomeNestedSortController::Sort
```

### Routes
In routes create a sort action with put method in the corresponding resource.
Let's assume that we have resources for pages:
```ruby
resources :pages
```
It will be:
```ruby
resources :pages do
  put :sort, on: :collection
end
```

### Javascripts
In application.js after jQuery add:
```ruby
//= require awesome_nested_sort/nestable
//= require awesome_nested_sort/awesome_nested_sort
```

### Stylesheets
In application.css add:
```ruby
*= require awesome_nested_sort/awesome_nested_sort
```

## Render the GUI
1. Load your resource:
```ruby
@pages = Page.sort_set
```
2. Render the GUI in the view.
- Use "data-sort-url" for the sort path (required).
- Use "data-model" for the model name (required).
- Use "data-depth" to set the max depth (default is 5, not required).
- Inside the loop you can render what you want to be as label in every node.
```ruby
<div class="dd" data-sort-url="<%= sort_pages_path %>" data-model="page" data-depth="2">
  <%= nested_dd(@pages) do |page| %>
    <%= page.title %>
  <% end %>
</div>

```

Have fun!