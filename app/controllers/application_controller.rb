class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :get_current_semester, :get_current_semester_and_year, :get_next_semester_and_year, :get_current_semester_and_year_from_date
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

def get_current_semester_from_date(time)
	return get_current_semester_and_year_from_date(time).split(" ")[0]
end 

def get_current_semester_and_year_from_date(time)
	#check intervals for winter- or summer-semester
	if (time.month.to_i < 5 or time.month.to_i  > 9)
		semester = "Wintersemester"
		#double if-clause to check which of both possible wintersemesters is meant.
		if (time.month.to_i < 5)
			year = " "+((time.year-1).to_s)+"/"+((time.year).to_s)
		else
			year = " "+((time.year).to_s)+"/"+((time.year+1).to_s)
		end
	elsif (time.month.to_i  > 4 and time.month.to_i  < 10)
		semester = "Sommersemester"
		year = " "+ (time.year).to_s
	end
	return semester + year
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

