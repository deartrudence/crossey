class ReviewCompleteMailer < ApplicationMailer
	require 'mailgun'
	def review_complete_email(employee)
		@employee = employee
		mail(
			to: "#{employee.user.email}", 
			subject: "Review Completed"
		)
	end
end

