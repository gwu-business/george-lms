#
# to run from the root directory: `ruby lib/generate_student_details.rb`
#

# Generate student details for each course.

require_relative "george"

current_courses = George::Term.current.courses
current_sections = current_courses.map{|course| course.sections }.flatten
current_sections.each do |section|
  section.generate_student_details # generate student details report
end
