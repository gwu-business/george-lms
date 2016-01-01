#
# to run from the root directory: `ruby lib/generate_rosters.rb`
#

# Generate machine-readable rosters for all current courses

require_relative "george"

current_courses = George::Term.current.courses
current_sections = current_courses.map{|course| course.sections }.flatten
current_sections.each do |section|
  section.generate_roster # generate enrollment report
end
