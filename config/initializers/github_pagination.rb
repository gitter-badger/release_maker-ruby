class Github::ResponseWrapper
  def total_pages
    if count_pages == 0
      current_page
    else
      count_pages
    end
  end

  def current_page
    page_iterator.current_api.arguments.params['page'].try(:to_i) || 1
  end

  def limit_value
    page_iterator.current_api.arguments.params['per_page'].try(:to_i)
  end
end
