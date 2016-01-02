# George LMS

A Learning Management System
 for assisting instructional operations
 of classes taught at the George Washington University.

Requires faculty access to the [GWeb Info System](https://banweb.gwu.edu).

Generates machine-readable class rosters and student detail reports.

## Usage

### Generate Enrollment Report

```` sh
ruby script/generate_enrollment_reports.rb
````

> This should produce a file for each course in the corresponding course directory: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/enrollments.csv

### Generate Student Report

```` sh
ruby script/generate_student_reports.rb
````

> This should produce a file for each course in the corresponding course directory: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/students.csv

### Generate Student Address Report

```` sh
ruby script/generate_student_address_reports.rb
````

> This should produce a file for each course in the corresponding course directory: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/student_addresses.csv

### Generate Student Transcript Report

```` sh
ruby script/generate_student_transcript_reports.rb
````

> This should produce a file for each course in the corresponding course directory: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/student_transcripts.csv






### Prerequisites


Download **Detailed Class List**:

 1. Log in to GWeb.
 * Navigate to the *Faculty Menu*.
 * Choose *Detail Class List*.
 * Select a *Term*. Submit selection.
 * Select a *Course*. Submit selection.
 * View *Detail Class List*, and download source (html-only).

> Save as: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/class_details.html

Download **Summary Class List**:

 1. Log in to GWeb.
 * Navigate to the *Faculty Menu*.
 + Choose *Summary Class List*.
 + Select a *Term*. Submit selection.
 + Select a *Course*. Submit selection.
 + View *Summary Class List*, and download source (html-only).

> Save as: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/class_summary.html

For each student, download **Student Address and Phones**:
  1. Log in to GWeb.
  * Navigate to the *Faculty Menu*.
  * Choose *Detail Class List*.
  * Select a *Term*. Submit selection.
  * Select a *Course*. Submit selection.
  * View *Detail Class List*
  * For each student, click on their name to view their addresses and phones, and download source (html-only).

> Save as: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/students/addresses/`:student_net_id`.html

For each student, download **Student Academic Transcript**:
  1. Log in to GWeb.
  * Navigate to the *Faculty Menu*.
  * Choose *Detail Class List*.
  * Select a *Term*. Submit selection.
  * Select a *Course*. Submit selection.
  * View *Detail Class List*.
  * For each student, click on their name to make this student the active selection.
  * Navigate back to the *Faculty Menu*
  * Choose *Student Academic Transcript*.
  * Select "All Levels" and "Web Transcript" from the drop-downs and click "Display Transcript".
  * Download source (html-only).

> Save as: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/students/transcripts/`:student_net_id`.html

## Contributing

To setup a development environment, install git, ruby, and bundler. Then clone this repository and install ruby package dependences:

```` sh
git clone git@github.com:gwu-business/george-lms.git
cd george-lms/
bundle install
````

### Testing

```` sh
ruby test/generate_enrollment_reports_test.rb
ruby test/generate_student_reports_test.rb
ruby test/generate_student_address_reports_test.rb
ruby test/generate_student_transcript_reports_test.rb
````

## [License](LICENSE)
