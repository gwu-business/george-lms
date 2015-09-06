#
# CODE LIBRARY (todo: refactor and separate into different files)
#

# resources:
#   + http://code.tutsplus.com/tutorials/ruby-for-newbies-working-with-directories-and-files--net-18810
#   + http://stackoverflow.com/a/8660782/670433
#   + http://stackoverflow.com/a/13399580/670433
#   + http://stackoverflow.com/a/7727416/670433
#   + http://ruby-doc.org/core-2.2.0/Dir.html
#   + https://github.com/debate-watch/twenty_sixteen/blob/9ea59464df64cabc1236991bf12b3ff6a9162a3b/lib/twenty_sixteen/candidate.rb
#   + https://github.com/s2t2/branford_station/blob/1f7fc32f2788e95b0748c3e96645b27d792e3f79/app/workers/google_transit_data_feed_extractor.rb
#   + https://github.com/s2t2/branford_station/blob/1f7fc32f2788e95b0748c3e96645b27d792e3f79/spec/workers/google_transit_data_feed_extractor_spec.rb

# assumptions:
#   + term identifiers can be converted into integers for numeric comparison

require 'pry'
require 'json'
#require 'open-uri'
#require 'nokogiri'
#require 'csv'

module George
  TERMS_PATH = File.expand_path("../../terms", __FILE__)
  TERMS_DIR = Dir.new(TERMS_PATH)

  #
  # term.rb
  #

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
      term_ids = TERMS_DIR.entries.reject{|t| t.include?(".")} # converts [".", "..", "201502", "201503"] to ["201502", "201503"]
      term_ids = term_ids.sort_by(&:to_i) # sorts in ascending order
      term_id = term_ids.last
      term_file = File.join(TERMS_DIR, term_id, "term.json")
      term_file_contents = File.read(term_file)
      term_attributes = JSON.parse(term_file_contents, :symbolize_names => true)
      Term.new(term_attributes)
    end

    def courses_path
      File.join(TERMS_DIR, self.id, "courses")
    end

    def courses_dir
      Dir.new(self.courses_path)
    end

    def course_ids
      self.courses_dir.entries.reject{|t| t.include?(".")} # converts [".", "..", "201502", "201503"] to ["201502", "201503"]
    end

    def courses
      self.course_ids.map do |course_id|
        course_file = File.join(self.courses_path, course_id, "course.json")
        course_file_contents = File.read(course_file)
        course_attributes = JSON.parse(course_file_contents, :symbolize_names => true)
        course_attributes.merge!({:term_id => self.id})
        Course.new(course_attributes)
      end
    end
  end

  #
  # course.rb
  #

  class Course
    attr_accessor :term_id, :department_id, :id

    def initialize(attributes)
      @term_id = attributes[:term_id]
      @department_id = attributes[:department_id]
      @id = attributes[:id]
    end

    def full_id
      "#{department_id}-#{id}"
    end

    def bulletin_description_url
      "http://bulletin.gwu.edu/search/?P=#{department_id}+#{id}"
    end

    def path
      File.join(TERMS_DIR, self.term_id, "courses", self.full_id)
    end

    def dir
      Dir.new(self.path)
    end

    def sections_path
      File.join(self.dir, "sections")
    end

    def sections_dir
      Dir.new(self.sections_path)
    end

    def section_ids
      self.sections_dir.entries.reject{|t| t.include?(".")} # converts [".", "..", "10", "11"] to ["10", "11"]
    end

    def sections
      self.section_ids.map do |section_id|
        section_attributes = {
          :term_id => self.term_id,
          :department_id => self.department_id,
          :course_id => self.id,
          :id => section_id
        }
        Section.new(section_attributes)
      end
    end
  end

  #
  # section.rb
  #

  class Section
    attr_accessor :id, :department_id, :course_id, :term_id

    def initialize(attributes)
      @term_id = attributes[:term_id]
      @department_id = attributes[:department_id]
      @course_id = attributes[:course_id]
      @id = attributes[:id]
    end

    def schedule_url
      "http://my.gwu.edu/mod/pws/courses.cfm?campId=1&termId=#{self.term_id}&subjId=#{self.department_id}"
    end

    def required_materials_url
      "http://www.bkstr.com/webapp/wcs/stores/servlet/booklookServlet?bookstore_id-1=122&term_id-1=#{self.term_id}&div-1=&dept-1=#{self.department_id}&course-1=#{self.course_id}&section-1=#{self.id}"
    end

    def generate_roster
      puts "GENERATING ROSTER FOR SECTION #{self.inspect}"
      puts self.schedule_url
      puts self.required_materials_url
    end
  end
end

#
# PROCESS/TASK
#

current_courses = George::Term.current.courses
current_sections = current_courses.map{|course| course.sections }.flatten
current_sections.each do |section|
  section.generate_roster
end
