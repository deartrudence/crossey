class PdfMailer < ApplicationMailer
	require 'mailgun'
	def pdf_email
		mail(
			to: 'hello@upatfive.ca', 
			subject: 'New Review'
		)
	end
end
