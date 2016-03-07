module ApplicationHelper
  def nav_entry(body, path, options = {})
    options = {
      badge: nil,
      badge_color: nil,
      icon: nil,
      class: ''
    }.merge(options)

    unless options[:icon].nil?
      body = "#{content_tag(:i, '', class: "mdi-#{options[:icon]}")} #{body}"
    end
    unless options[:badge].nil?
      body << content_badge(options)
    end

    content_tag(:li, link_to(body.html_safe, path), class: ("#{'active ' if current_page? path}#{options[:class]}"))
  end

  def list_group_item(body, path, options = {})
    options = {
      badge: nil,
      badge_color: nil,
      class: ''
    }.merge(options)

    unless options[:badge].nil? or options[:badge] == 0
      body << content_badge(options)
    end

    content_tag(:a, body.html_safe, href: path, class: ("list-group-item #{'active ' if current_page? path}#{options[:class]}"))
  end

  def bootstrap_color(c)
    case c
    when 'error', 'alert'
      'danger'
    when 'notice'
      'info'
    else
      c
    end
  end

  private

  def content_badge(options)
    " #{
      content_tag(:span, options[:badge], class: ("badge#{
        " badge-#{options[:badge_color]}" unless options[:badge_color].nil?
      }"))}"
  end
end
