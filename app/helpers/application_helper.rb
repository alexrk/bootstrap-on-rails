module ApplicationHelper
  def link_to_void(*args, &block)
    link_to(*args.insert((block_given? ? 0 : 1), "javascript:void(0)"), &block)
  end

  def row(content_or_options_with_block = nil, options = nil, &block)
    if block_given?
      options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
      content_or_options_with_block = capture(&block)
    end
    options ||= {}
    options[:class] = ["row", options[:class]].compact.join(" ")
    content_tag(:div, content_or_options_with_block, options)
  end

  def span(width = 12, content_or_options_with_block = nil, options = nil, &block)
    if block_given?
      options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
      content_or_options_with_block = capture(&block)
    end
    options ||= {}
    options[:class] = ["span#{width}", options[:class]].compact.join(" ")
    content_tag(:div, content_or_options_with_block, options)
  end

  def row_span12(content = nil, &block)
    row(span(12, content, &block))
  end

  def flash_message_list
    flash_types = {
      :error => "alert-error",
      :alert => "alert-error",
      :notice => "alert-success" }
    list = flash.collect do |type, content|
      row_span12 do
        content_tag :div, :class => (["alert", flash_types[type]].compact) do
          link_to_void("&times;".html_safe,
            :class => "close", :data => { :dismiss => "alert" }) + content
        end
      end
    end
    safe_join(list)
  end

  def render_flash_messages
    content_tag :div, flash_message_list, :class => "container flash-messages" unless flash.empty?
  end
end
