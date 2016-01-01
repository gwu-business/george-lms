#
# test for lib/generate_student_details.rb
# to run from the root directory: `ruby test/generate_student_details_test.rb`
#

require 'pry'
require 'fileutils'

TERMS_PATH = File.expand_path("../../terms", __FILE__)

istm4121_student_details_report_path = File.join(TERMS_PATH, "201503", "courses", "istm-4121", "sections", "10", "reports", "student_details.csv")

pp istm4121_student_details_report_path

FileUtils.rm_f(istm4121_student_details_report_path)

system "ruby lib/generate_student_details.rb"

passes_test = File.exist?(istm4121_student_details_report_path)

puts "TEST PASSES? -- #{passes_test}"
