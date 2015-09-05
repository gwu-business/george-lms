# resources:
#   + http://code.tutsplus.com/tutorials/ruby-for-newbies-working-with-directories-and-files--net-18810
#   + http://stackoverflow.com/a/8660782/670433
#   + http://stackoverflow.com/a/13399580/670433
#   + http://stackoverflow.com/a/7727416/670433
#   + http://ruby-doc.org/core-2.2.0/Dir.html
#   + https://github.com/debate-watch/twenty_sixteen/blob/9ea59464df64cabc1236991bf12b3ff6a9162a3b/lib/twenty_sixteen/candidate.rb

# assumptions:
#   + term identifiers are integer-convertable

require 'pry'
require 'json'
#require 'open-uri'
#require 'nokogiri'
#require 'csv'

class Term
  attr_accessor :id, :name, :start_date, :end_date, :tentative_finals_schedule_url

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @start_date = attributes[:start_date]
    @end_date = attributes[:start_date]
    @tentative_finals_schedule_url = attributes[:tentative_finals_schedule_url]
  end

  def self.current
    terms_path = File.expand_path("../../terms", __FILE__)
    terms_dir = Dir.new(terms_path)
    term_ids = terms_dir.entries.reject{|t| t.include?(".")} # converts [".", "..", "201502", "201503"] to ["201502", "201503"]
    term_ids = term_ids.sort_by(&:to_i) # sorts term ids in ascending order
    term_id = term_ids.last
    term_file = File.join(terms_dir, term_id, "term.json")
    term_file_contents = File.read(term_file)
    term_attributes = JSON.parse(term_file_contents, :symbolize_names => true)
    term = Term.new(term_attributes)
  end
end

class Course
  def self.all
    Term.current.courses
  end
end

class Roster
  def self.generate(course)
    binding.pry
  end
end

Term.current.courses.each do |course|
  Roster.generate(course)
end























#class GWeb ; end
#class GWeb::Report ; end
#class GWeb::Report::FacultyDetailSchedule ; end
#class GWeb::Report::DetailFacultyClassList ; end
#class GWeb::Report::SummaryFacultyClassList ; end
#class Student ; end
#class Instructor ; end
#class Faculty < Instructor ; end
#class TeachingAssistant < Instructor ; end
