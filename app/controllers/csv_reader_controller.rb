# The Controller written for our CSV-Reader.
#It checks the input, calls import and refers back afterwards.
class CsvReaderController < ApplicationController
	def import

		if request.post? && !params[:file].nil? 
	  	
	  	file = params[:file]
  	
	  		if  file[-4..-1] == ".csv"  # .csv data?
		  		if Event.import(params[:file])	
		  		redirect_to :back , notice: "Die Veranstaltungen der ausgewählten CSV-Datei wurden erfolgreich in die Datenbank eingelesen."
		  		else
		  		redirect_to :back, alert: "Import fehlgeschlagen. Falsche Formatierung."
		  		end
			else
			redirect_to :back, alert: "Import fehlgeschlagen.Keine CSV-Datei."
			end
		else
		redirect_to :back, alert: "Import fehlgeschlagen." 
		end	
   end 
end
