module ApplicationHelper
  
  def status_tag(boolean, option={})
    option[:true] ||= ''
    option[:true_class] ||= 'status true'
    option[:false] ||= ''
    option[:false_class] ||= 'status false'

    if boolean
      content_tag(:span, option[:true], :class => option[:true_class])
    else
      content_tag(:span, option[:false], :class => option[:false_class])
    end
  end
  
  def error_messages_for(object)
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end
  
end
