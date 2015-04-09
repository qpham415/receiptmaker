WickedPdf.config do |config|
  if Rails.env.staging? || Rails.env.production?
    exe_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
  else  ### Following allows for development on my MacBook or Linux box
    if /darwin/ =~ RUBY_PLATFORM then
      config.exe_path = '/usr/local/bin/wkhtmltopdf'
    elsif /linux/ =~ RUBY_PLATFORM then
      config.exe_path = '/usr/bin/wkhtmltopdf'
    else
      raise "UnableToLocateWkhtmltopdf"
    end
  end
end
