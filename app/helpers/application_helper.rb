module ApplicationHelper

	#return full page title based on current page
	def full_title(page_title)
		base_title = "Ruby on Rails Sample App"
		if page_title.empty?
			 base_title
		else
		 "#{base_title}"|"#{page_title}"
		end
	end
	
   def sort_link(title, column, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    sort_dir = params[:d] == 'up' ? 'down' : 'up'
    link_to_unless condition, title, request.parameters.merge( {:c => column, :d => sort_dir} )
  end

end
