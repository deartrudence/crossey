# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
review1 = Review.create(name: 'EIT')

sections = ['Section I', 'Section II', 'Section III', 'Section IV', 'Section V']

questions = [
	['Section I', 'Drawing', 'Creates drawings in accordance with CEL standards', 'check_box'],
	['Section I', 'Drawing', 'Drawing tagging is complete ', 'check_box'],
	['Section I', 'Drawing', 'Drawing presentation is neat and tidy', 'check_box'],
	['Section I', 'Drawing', 'Able to follow technical instructions for drawings', 'check_box'],
	['Section I', 'Drawing', 'Asks questions when appropriate', 'check_box'],
	['Section I', 'Drawing', 'Reviews work to ensure it is complete and technically accurate', 'check_box'],
	['Section I', 'Drawing', 'Follows CEL standards for filing design and archiving material as appropriate ', 'check_box'],
	['Section I', 'Drawing', 'Understands project objectives and scope', 'check_box'],
	['Section I', 'Production', 'Meets required deadlines for work assigned', 'check_box'],
	['Section I', 'Production', 'Identifies that assigned work cannot be completed within alloted timeframe', 'check_box'],
	['Section I', 'Layout', "Able to implement layouts in accordance to PM's direction", 'check_box'],
	['Section I', 'Layout', "Makes layout decisions and coordinates with other services", 'check_box'],
	['Section I', 'Layout', "Provides designers with direction on implementing concept(s)", 'check_box'],
	['Section I', 'Layout', "Provides direction for 3D coordination of services", 'check_box'],
	['Section II', 'Calculations', "Performs load calculations accurately", 'check_box'],
	['Section II', 'Calculations', "Reviews load calculations and ensures accuracy", 'check_box'],
	['Section II', 'Calculations', "Performs lighting calculations", 'check_box'],
	['Section II', 'Calculations', "Performs voltage drop calculations", 'check_box'],
	['Section II', 'Calculations', "Performs fault calculations", 'check_box'],
	['Section II', 'Calculations', "Reviews lighting calculations", 'check_box'],
	['Section II', 'Calculations', "Reviews voltage drop calculations", 'check_box'],
	['Section II', 'Calculations', "Reviews fault calculations", 'check_box'],
	['Section II', 'Calculations', "Performs building air balance/building pressurization calculations", 'check_box'],
	['Section II', 'Calculations', "Reviews building air balance/building pressurization calculations", 'check_box'],
	['Section II', 'Calculations', "Reviews for compliance with OBC SB-10 and/or ASHRAE 90.1", 'check_box'],
	['Section II', 'Calculations', "Performs static pressure/back-pressure/pump head pressure calculations", 'check_box'],
	['Section II', 'Calculations', "Reviews static pressure/back-pressure/pump head pressure calculations", 'check_box'],
	['Section II', 'Calculations', "Performs gas pipe sizing", 'check_box'],
	['Section II', 'Calculations', "Reviews gas pipe sizing", 'check_box'],
	['Section II', 'Calculations', "Performs plumbing load calculations ", 'check_box'],
	['Section II', 'Calculations', "Reviews plumbing load calculations", 'check_box'],
	['Section II', 'Calculations', "Knowledge of related codes, regulations and standards", 'check_box'],
]

sections.each do |section|
	review1.sections.create(title: section)
end

questions.each do |question|
	if question[0] == "Section I"
		sec = Section.find_by_title('Section I')
	elsif question[0] == 'Section II'
		sec = Section.find_by_title('Section II')
	end
	Question.create(section_id: sec.id, subsection: question[1], question_text: question[2], question_type: question[3])
end