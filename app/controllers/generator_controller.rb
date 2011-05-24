class GeneratorController < ApplicationController

	require "pdfkit"
	
	def generate
    @accion = Accion.find(params[:id])
		respond_to do
  	  	html = render_to_string(:layout => false , :action => "accion.pdf.erb")
	  	  kit = PDFKit.new(html)
  	  	kit.stylesheets << "#{Rails.root}/public/stylesheets/scaffold.css"
	    	send_data(kit.to_pdf, :filename => "labels.pdf", :type => 'application/pdf')
		    return # to avoid double render call
		end
  end



end
