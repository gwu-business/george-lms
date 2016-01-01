#
# to run from the root directory: `ruby lib/grade_survey_assignment_submissions.rb`
#

# Grade survey assignment submissions and post grades to gradebook

require_relative "george"

current_courses = George::Term.current.courses
current_sections = current_courses.map{|course| course.sections }.flatten
current_sections.each do |section|
  section.grade_survey_assignment_submissions
end
