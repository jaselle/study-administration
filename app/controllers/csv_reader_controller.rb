# Vtecker,pklein
# The Controller written for our CSV-Reader.
# Just calls the import and refers back afterwards.
class CsvReaderController < ApplicationController
	def import

  		Event.import(params[:file])
  		
  		# After the successful import of the CSV-File , we refer back to the current page.
  		redirect_to :back , notice: "Die Veranstaltungen der ausgewählten CSV-Datei wurden erfolgreich in die Datenbank eingelesen."
  	end
end