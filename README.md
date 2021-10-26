# ActiveHtmlTags

A simple helper to simplify the generation of html by bringing `content_tag` to the next level.

# Getting started

Add the gem to your Gemfile. For the last officially released gem:

```ruby
gem 'active_html_tags'
```

Now you should be able to use any html tag as a ruby method in your views.

# Usage

ActiveHtmlTags is a helper to use any kind of HTML tag as a direct method instead of passing it to `content_tag`. At the same time it allows for multiple arguments to be given and for smarter options.

```ruby
# In any view using ApplicationHelper, for example in app/views/___/___.html.erb or app/views/layouts/application.html.erb

<%= h1 "This is pretty awesome" %>
<%= content_tag :h1, "compared to this" %>
```

The name mappings from html tags to method names are 1:1. Therefore you can create constructs like these:
```ruby
<%= div do %>
  <%= table do %>
    <%= tr do %>
      <%= th "but it doesn't stop here" %>
      <%= td do %>
         you can make such nice tables
      <% end %>
    <% end %>
    <%= tr(th("very dense tables?"), td(:yes)) %>
  <% end %>

  <%= table tr(th("complete tables?"), td(:yes)) %>
<% end %>
```

A list of all HTML available and usable tags can be found on [w3schools - TAGs](https://www.w3schools.com/TAGs/)

### Unlimited arguments

Additionally the `content_tag` method signature has been improved slightly. Now it supports a list of arguments
```ruby
<%= h1 "This is pretty awesome", "because you can add as much as you want", small("and what you want") %>
vs
<%= content_tag :h1, safe_join(["this is", "not very", "sexy", content_tag(:small, "or readable")], " ") %>
```

### Advanced options for style

Have you ever wondered why this happens with css? Now you don't have run into this anymore, arrays and hashes are first class citizens in ActiveHtmlTags.

```ruby
<%= span "this text is actually green", style: {color: :green}%>
# <span style="color: green">this text is actually green</span>
vs
<%= content_tag :span, "this text is sadly not green", style: {color: :green}%>
# <span style="{color: :green}">this text is sadly not green</span>
```

This allows for more complex scenarios
```ruby
<%= base_style = {"background-color" => "blue"} # Place this somewhere nicely to allow for compositon. %>

<%= span "this text is actually green on blue", style: base_style.merge({color: :green}) %>
# <span style="background-color: blue ; color: green">this text is actually green on blue</span>
```

Of course arrays are loved too.
```ruby
<% base_style = ["background-color: blue"]%>

<%= span "this text is actually green on blue", style: base_style + ["color: green"] %>
# <span style="background-color: blue ; color: green">this text is actually green on blue</span>
```

Boht arrays and hashes are joined using ` ; `

### Advanced options for javascript

Options will be joined using ` ; ` in case of html attributes who require javascript. A reference of these is also available here: [w3schools - HTML Attribute Reference](https://www.w3schools.com/tags/ref_attributes.asp)
```ruby
<%= span "don't click me", onclick: ["1 + 1", "2 + 2"] %>
# <span onclick="1 + 1 ; 2 + 2">don't click me</span>
```

Only the values will be shown in case of hashes. This allows easier code re-use and overwriting.
```ruby
<%= span "don't click me", onclick: {base: "1 + 1", feature: "2 + 2"} %>
# <span onclick="1 + 1 ; 2 + 2">don't click me</span>
```

### Advanced options for class and all other attributes

In all other cases, arrays and hash values will be joined using spaces ` `. A reference of all html attributes is also available here: [w3schools - HTML Attribute Reference](https://www.w3schools.com/tags/ref_attributes.asp)

```ruby
<% current_color = good_or_bad ? "btn-primary" : "btn-default" %>
<% current_size = nice_or_cool ? "btn-lg" : "btn-sm" %>
<%= span "a nice bootstrap button", class: ["btn", current_state, current_size] %>
# <span class="btn btn-primary btn-lg">a nice boostrap button</span>
```

In case of hashes, you can override values easier.
```ruby
<% base_button = {base: :btn, color: "btn-primary"} %>

<%= span "a nice bootstrap button", class: base_button) %>
# <span class="btn btn-primary">a nice boostrap button</span>

<%= span "a nice bootstrap button", class: base_button.merge({color: "btn-danger"}) %>
# <span class="btn btn-danger">a nice boostrap button</span>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'active_html_tags'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install active_html_tags
```

## Contributing

Feel free to create a merge request in case of bugs, features and more.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
