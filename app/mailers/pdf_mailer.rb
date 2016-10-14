class PdfMailer < ApplicationMailer
	require 'mailgun'
	def pdf_email(pdf, employee)
		
		attachments["review-#{employee.name}.pdf"] = pdf
		mail(
			to: 'hello@upatfive.ca', 
			subject: 'New Review'
		)
	end
end
