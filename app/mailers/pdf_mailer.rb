class PdfMailer < ApplicationMailer
	require 'mailgun'
	def pdf_email(pdf, employee)
		@employee = employee
		attachments["review-#{employee.name}.pdf"] = pdf
		mail(
			to: 'adele.salvati@cel.ca', 
			subject: 'New Review'
		)
	end
end
