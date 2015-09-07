#
# test for lib/generate_rosters.rb
# to run from the root directory: `ruby test/generate_rosters_test.rb`
#

require 'pry'
require 'fileutils'

TERMS_PATH = File.expand_path("../../terms", __FILE__)

istm4121_enrollment_report_path = File.join(TERMS_PATH, "201503", "courses", "istm-4121", "sections", "10", "reports", "enrollments.csv")

pp istm4121_enrollment_report_path

FileUtils.rm_f(istm4121_enrollment_report_path)

system "ruby lib/generate_rosters.rb"

passes_test = File.exist?(istm4121_enrollment_report_path)

puts "TEST PASSES? -- #{passes_test}"
