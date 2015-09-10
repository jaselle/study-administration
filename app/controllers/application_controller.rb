class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :get_current_semester, :get_current_semester_and_year, :get_next_semester_and_year
  protect_from_forgery with: :exception

def js_logged_in
  if(!logged_in?)
    flash[:error] = "Login erforderlich für Rating!"
    render :js => "window.location = '/login'"
  end
end

# proctected sites unauthorized users
 helper_method :not_authorized, :redirect_to_profile
 def not_authorized(text)
 	redirect_to root_path, alert: text
 end
# gets the current semester calculated with the current date 
def get_current_semester_and_year()
	#check intervals for winter- or summer-semester
	if (Time.now.month < 5 or Time.now.month  > 9)
		semester = "Wintersemester"
		#double if-clause to check which of both possible wintersemesters is meant.
		if (Time.now.month < 5)
			year = " "+((Time.now.year-1).to_s)+"/"+Date.today.strftime("%Y")
		else
			year = " "+Date.today.strftime("%Y")+"/"+((Time.now.year+1).to_s)
		end
	elsif (Time.now.month  > 4 and Time.now.month  < 10)
		semester = "Sommersemester"
		year = " "+ Date.today.strftime("%Y")
	end

	return semester + year
end		

def get_current_semester
	return get_current_semester_and_year.split(" ")[0]
end 

def get_next_semester_and_year(text)
	
	if (text.split(" ")[0] == "Wintersemester")
		semester = "Sommersemester"
		year = (text.split(" ")[1].split("/")[0].to_i + 1).to_s
	else
		semester = "Wintersemester"
		year1 = text.split(" ")[1].split("/")[0].to_i
		year2 = year1 + 1
		year = (year1.to_s)+"/"+(year2.to_s)
	end
	

	return semester +" "+ year

end

 def redirect_to_profile
 	redirect_to profile_path(@user.profile)
 end

# needed? does not work we assume
def some_method
  redirect_to :back
rescue ActionController::RedirectBackError
  redirect_to :root
end

add_flash_types :my_flash

end

