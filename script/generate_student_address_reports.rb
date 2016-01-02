#
# to run from the root directory: `ruby script/generate_student_address_reports.rb`
#

# Generate student address report for each course.

require_relative "../lib/george.rb"

current_courses = George::Term.current.courses
current_sections = current_courses.map{|course| course.sections }.flatten
current_sections.each do |section|
  section.generate_student_address_report # generate student address report
  #section.generate_student_transcript_report # generate student transcript report
end
