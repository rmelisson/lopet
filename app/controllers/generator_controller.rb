class GeneratorController < ApplicationController

	require "pdfkit"
	require "populator"

	#TODO factorize those 2 methods	
	def generate
    @accion = Accion.find(params[:id])
		respond_to do
  	  	html = render_to_string(:layout => false , :action =>
"accion.pdf.erb", :locals => {:arguments =>
RedCloth.new(@accion.formulario.arguments).to_html} )
	  	  kit = PDFKit.new(html)
  	  	kit.stylesheets <<
"#{Rails.root}/public/stylesheets/generated_pdf.css"
				file_name = "accion-" + @accion.id.to_s + ".pdf"
	    	send_data(kit.to_pdf, :filename => file_name , :type => 'application/pdf')
		    return # to avoid double render call
		end
  end

	def generate_example
		@accion = Accion.new(:formulario_id => params[:id], :user_id => 1)
		@accion.hechos = Populator.sentences(3..6)
		@accion.id = 0
		respond_to do
  	  	html = render_to_string(:layout => false , :action => "accion.pdf.erb", :locals => {:arguments => RedCloth.new(@accion.formulario.arguments).to_html, :num_demandante => "123456"} )
	  	  kit = PDFKit.new(html)
  	  	kit.stylesheets << "#{Rails.root}/public/stylesheets/generated_pdf.css"
				file_name = "accion-" + @accion.id.to_s + ".pdf"
	    	send_data(kit.to_pdf, :filename => file_name , :type => 'application/pdf')
		    return # to avoid double render call
		end
	end

end
