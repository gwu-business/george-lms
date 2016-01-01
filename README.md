# George LMS

A Learning Management System
 for assisting instructional operations
 of classes taught at the George Washington University.

Requires faculty access to the [GWeb Info System](https://banweb.gwu.edu).

System Functions:

 + Generates machine-readable (.csv) class rosters from GWeb
 + Uploads rosters to Google Drive
 + Converts Google Drive rosters to Google Drive grade books
 + Evaluates student survey assignment submissions, and updates grade books accordingly

## Usage

### Generate Roster

Download **Detailed Class List**.

 1. Log in to GWeb.
 * Navigate to the *Faculty Menu*.
 * Choose *Detail Class List*.
 * Select a *Term*. Submit selection.
 * Select a *Course*. Submit selection.
 * View *Detail Faculty Class List*, and download source (html-only).

> Save as: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/class_details.html

Download **Summary Class List**.

 1. Log in to GWeb.
 * Navigate to the *Faculty Menu*.
 + Choose *Summary Class List*.
 + Select a *Term*. Submit selection.
 + Select a *Course*. Submit selection.
 + View *Summary Faculty Class List*, and download source (html-only).

> Save as: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/class_summary.html

Run the roster-generation script.

```` sh
ruby lib/generate_rosters.rb
````

> This should produce a file for each course in the corresponding course directory: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/reports/enrollments.csv

### Grade Survey Submissions

Run the survey-grader script.

```` sh
ruby lib/grade_surveys.rb
````

## Contributing

To setup a development environment:
 + install git
 + install ruby
 + install bundler

Then clone this repository and install ruby package dependences:

```` sh
git clone git@github.com:gwu-business/george-lms.git
cd george-lms/
bundle install
````

### Testing

To test the roster-generation script, run:

```` sh
ruby test/generate_rosters_test.rb
````

## [License](LICENSE)
