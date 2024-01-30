module ApplicationHelper
    def render_error_messages(model, attribute)
      messages = model.errors.full_messages_for(attribute)
      return unless messages.any?
  
      content_tag(:div, messages.join(', '), class: 'text-danger')
    end
  end
  