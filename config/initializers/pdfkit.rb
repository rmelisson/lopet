PDFKit.configure do |config|
    config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
    config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s if Rails.env.production?  
end


