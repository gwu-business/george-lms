#
# to run from the root directory: `ruby script/generate_enrollment_reports.rb`
#

# Generate enrollment report for each current course.

require_relative "../lib/george.rb"

current_courses = George::Term.current.courses
current_sections = current_courses.map{|course| course.sections }.flatten
current_sections.each do |section|
  section.generate_enrollment_report # generate enrollment report
end
