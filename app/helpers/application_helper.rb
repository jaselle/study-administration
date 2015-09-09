module ApplicationHelper

	def getBirthDateStart()
		Time.now.year - 100
	end
	
	def getBirthDateEnd()
		Time.now.year
	end		

	def sortable(column, title = nil)
		title ||= column.titleize
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, params.merge(:sort => column, :direction => direction, :page => nil, :search => params[:search]), :class => "our_sort"
	end
end
